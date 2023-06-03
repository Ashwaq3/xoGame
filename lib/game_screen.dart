import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xogame/logic.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Consumer<Game>(builder: (_, val, __) {
            return Text("It's ${val.activePlayer} turn".toUpperCase(),
                style: const TextStyle(fontSize: 52));
          }),
          buildGameGrid(context),
         ...buildLastBlock(context)
        ],
      )),
    );
  }

  Expanded buildGameGrid(BuildContext context) {
    return Expanded(
        child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
            children: List.generate(
                9,
                (index) => InkWell(
                      onTap: Provider.of<Game>(context).isGameOver ? null : () => Provider.of<Game>(context, listen: false).playGame(index),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Consumer<Game>(
                          builder: (_, val, __) {
                            return Text(val.boardFields[index],
                              style: TextStyle(
                                  color:  val.boardFields[index] == "X"
                                      ? Colors.white
                                      : Colors.deepOrange,
                                  fontSize: 52),
                            );
                          }
                        ),
                      ),
                    ))));
  }

  List<Widget> buildLastBlock(BuildContext context) {
    return [if (Provider.of<Game>(context).isGameOver) buildResultTitle(context),
      buildRepeatButton(context)
    ];
  }

  Widget buildResultTitle(BuildContext context) {

    return Consumer<Game>(
      builder: (_, val, __) {
        return Text("Results: ${val.gameResult}",
            style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.5)));
      }
    );
  }

  Widget buildRepeatButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed:() => Provider.of<Game>(context, listen: false).resetGame(),
      icon: const Icon(Icons.replay),
      label: const Text("Repeat"),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).splashColor)),
    );
  }
}
