import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'app.dart';
import 'injection.dart';

void main() async {
  await startApp();
  runApp(const MyApp());
}

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
}
