import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'game_screen.dart';
import 'game_logic.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String appName = 'Tic Tac Toe Game';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.purple,
          primaryColor: Colors.orange,
          splashColor: Colors.pinkAccent,
          shadowColor: Colors.amberAccent,
        ),
        home: ChangeNotifierProvider(
          create: (_) => GameLogic(),
          child: const GameScreen(),
        ));
  }
}
