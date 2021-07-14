import 'package:flutter/material.dart';
import 'package:atyourfingertips/screens/onboarding.dart';
import 'package:atyourfingertips/screens/mainMenu.dart';
import 'package:atyourfingertips/screens/create_lists.dart';
import 'package:atyourfingertips/screens/yourlists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '@your fingertips',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: OnboardingScreen.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ListScreen.id: (context) => ListScreen(),
        MainMenu.id: (context) => HomeScreen(),
      },
    );
  }
}
