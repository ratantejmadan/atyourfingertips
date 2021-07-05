import 'package:flutter/material.dart';
import 'package:atyourfingertips/screens/onboarding.dart';
import 'package:atyourfingertips/screens/mainMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@your fingertips',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: OnboardingScreen.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),
        MainMenu.id: (context) => MainMenu(),
      },
    );
  }
}
