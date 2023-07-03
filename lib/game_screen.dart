import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'game_logic.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              buildActivePlayerWidget(context: context),
              buildGameBoard(context: context),
              if (Provider.of<GameLogic>(context).isGameOver) buildResultWidget(context: context),
              buildResetButton(context: context)
        ],
      )),
    );
  }

  Widget buildActivePlayerWidget({required BuildContext context}) {
    return Consumer<GameLogic>(builder: (_, val, __) {
      return Text("It's ${val.activePlayer} turn".toUpperCase(),
          style: const TextStyle(fontSize: 52));
    });
  }

  Expanded buildGameBoard({required BuildContext context}) {
    return Expanded(
        child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
            children: List.generate(
                9,
                (index) => buildBoardField(context: context, index: index))));
  }

  Widget buildBoardField({required BuildContext context, required int index}) {
    return InkWell(
      onTap: () =>
          Provider.of<GameLogic>(context, listen: false)
              .playGame(index: index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).shadowColor,
            borderRadius: BorderRadius.circular(5)),
        child: Consumer<GameLogic>(builder: (_, val, __) {
          return Text(
            val.boardFields[index],
            style: TextStyle(
                color: val.boardFields[index] == "X"
                    ? Colors.white
                    : Colors.deepOrange,
                fontSize: 52),
          );
        }),
      ),
    );
  }

  Widget buildResultWidget({required BuildContext context}) {
    return Consumer<GameLogic>(builder: (_, val, __) {
      return Text("Winner: ${val.gameResult}",
          style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.5)));
    });
  }

  Widget buildResetButton({required BuildContext context}) {
    return ElevatedButton.icon(
      onPressed: () =>
          Provider.of<GameLogic>(context, listen: false).resetGame(),
      icon: const Icon(Icons.replay),
      label: const Text("Reset"),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).splashColor)),
    );
  }
}
