import 'package:challenge1/app.dart';
import 'package:challenge1/firebase_options.dart';
import 'package:challenge1/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectionContainer();
  runApp(const MyApp());
}
