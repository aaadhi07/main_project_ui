import 'package:flutter/material.dart';
import 'package:main_project_ui/view/splash_screen/splash_screen.dart';

void main() {
  runApp(WellnessApp());
}

class WellnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
