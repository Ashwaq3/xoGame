import 'package:flutter/material.dart';

import 'game_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String gameTitle = 'XO Game';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: gameTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: Colors.orange,
        splashColor: Colors.pinkAccent,
        shadowColor: Colors.amberAccent,

      ),
      home: const GameScreen()
    );
  }
}


