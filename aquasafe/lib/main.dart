import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(AquaSafeApp());
}

class AquaSafeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaSafe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
