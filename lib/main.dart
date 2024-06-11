import 'package:challenge1/app.dart';
import 'package:challenge1/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectionContainer();
  runApp(const MyApp());
}
