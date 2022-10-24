import 'package:nixo/features/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String username,
    required String email,
    String? password,
    required String avatar,
  }) : super(
          id: id,
          username: username,
          email: email,
          avatar: avatar,
          password: password,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.get('id'),
      username: snapshot.get('username'),
      email: snapshot.get('email'),
      avatar: snapshot.get('avatar'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "avatar": avatar,
    };
  }
}
