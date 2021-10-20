import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc/simple_bloc_observer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp();

  // Bloc observer for debugging purpose
  // Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}
