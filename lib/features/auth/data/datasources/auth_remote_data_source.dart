import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nixo/core/error/exception.dart';
import 'package:nixo/core/firebase/endpoints.dart';
import 'package:nixo/features/auth/data/models/user_model.dart';
import 'package:nixo/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp(UserEntity user);
  Future<void> createUser(UserEntity user);
  Future<void> googleAuth();
  Future<void> facebookAuth();
  Future<void> forgotPassword(String email);
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  final FacebookAuth facebookauth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.fireStore,
    required this.auth,
    required this.facebookauth,
    required this.googleSignIn,
  });

  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = fireStore.collection(Endpoint.usersCollection);
    final uid = await getCurrentUId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        username: user.username,
        id: uid,
        avatar: '',
        email: user.email,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
        return;
      } else {
        userCollection.doc(uid).update(newUser);
        return;
      }
    }).catchError((_) {
      throw ServerException();
    });
  }

  @override
  Future<void> facebookAuth() async {
    final usersCollection = fireStore.collection(Endpoint.usersCollection);

    try {
      final LoginResult loginResult = await facebookauth.login();
      final OAuthCredential credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final information = (await auth.signInWithCredential(credential)).user;
      usersCollection.doc(auth.currentUser!.uid).get().then((user) async {
        if (!user.exists) {
          var uid = auth.currentUser!.uid;
          var newUser = UserModel(
            username: information!.displayName!,
            id: uid,
            avatar: information.photoURL ?? "",
            email: information.email!,
          ).toDocument();
          usersCollection.doc(uid).set(newUser);
        }
      }).whenComplete(() {
        print("New User Created Successfully");
      }).catchError((e) {
        throw ServerException();
      });
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email).catchError((_) {
      throw ServerException();
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<void> googleAuth() async {
    final usersCollection = fireStore.collection(Endpoint.usersCollection);
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final information = (await auth.signInWithCredential(credential)).user;
      usersCollection.doc(auth.currentUser!.uid).get().then((user) async {
        if (!user.exists) {
          var uid = auth.currentUser!.uid;
          var newUser = UserModel(
            username: information!.displayName!,
            id: uid,
            avatar: information.photoURL ?? "",
            email: information.email!,
          ).toDocument();
          usersCollection.doc(uid).set(newUser);
        }
      }).whenComplete(() {
        print("New User Created Successfully");
      }).catchError((e) {
        throw ServerException();
      });
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password!);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await facebookauth.logOut();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> signUp(UserEntity user) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);
    } catch (e) {
      throw ServerException();
    }
  }
}
