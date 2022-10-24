import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/core/bloc/bloc_observer.dart';
import 'package:nixo/firebase_options.dart';

import 'app.dart';
import 'package:nixo/core/dependencies/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const NixoApp());
}
