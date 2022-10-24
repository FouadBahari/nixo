import 'package:firebase_core/firebase_core.dart';
import 'package:nixo/firebase_options.dart';

class FirebaseInitializer {
  static Future<void> initialize() {
    return Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
