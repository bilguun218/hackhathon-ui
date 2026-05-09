import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AccessPlan UB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0052CC)),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}
