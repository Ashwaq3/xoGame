import 'package:flutter/material.dart';
import 'package:xogame/logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isTwoPlayers = false;
  String activePlayer = Player.playerX;
  String gameResult = "";
  int numberOfTurns = 0;
  bool isGameOver = false;
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  ...buildFirstBlock(),
                  buildGameGrid(context),
                  ...buildLastBlock()
                ],
              )
            : Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buildFirstBlock(),
                      ...buildLastBlock(),
                    ],
                  )),
                  buildGameGrid(context),
                ],
              )
      ),
    );
  }


  List<Widget> buildFirstBlock() {
    return [
      buildSwitchTile(),
      buildPlayerTurnTitle()
    ];
  }

  Widget buildSwitchTile(){
    return    SwitchListTile.adaptive(
        title: const Text("Switch on/off two players mood"),
        value: isTwoPlayers,
        onChanged: (newValue) {
          setState(() {
            isTwoPlayers = newValue;
          });
        });
  }

  Widget buildPlayerTurnTitle(){
    return Text("It's $activePlayer turn".toUpperCase(),
        style: const TextStyle(fontSize: 52));
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
                  onTap: isGameOver ? null : () => playGame(index),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      Player.playerXPlayedIndices.contains(index)
                          ? Player.playerX
                          : Player.playerOPlayedIndices.contains(index)
                          ? Player.playerO
                          : Player.empty,
                      style: TextStyle(
                          color: Player.playerXPlayedIndices.contains(index)
                              ? Colors.white
                              : Colors.deepOrange,
                          fontSize: 52),
                    ),
                  ),
                ))));
  }

  List<Widget> buildLastBlock() {
    return [
      if (isGameOver)
        buildResultTitle(),
      buildRepeatButton()

    ];
  }

  Widget buildResultTitle(){
    return Text("Results: $gameResult",
        style:
        TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.5)));
  }

  Widget buildRepeatButton(){
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          Player.playerXPlayedIndices = [];
          Player.playerOPlayedIndices = [];
          activePlayer = Player.playerX;
          gameResult = "";
          numberOfTurns = 0;
          isGameOver = false;
        });
      },
      icon: const Icon(Icons.replay),
      label: const Text("Repeat"),
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(Theme.of(context).splashColor)),
    );
  }

  playGame(int index) async {
    if ((Player.playerXPlayedIndices.isEmpty ||
            !Player.playerXPlayedIndices.contains(index)) &&
        (Player.playerOPlayedIndices.isEmpty ||
            !Player.playerOPlayedIndices.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();
      if (!isTwoPlayers && !isGameOver) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  updateState() {
    setState(() {
      activePlayer = activePlayer == Player.playerX ? Player.playerO : Player.playerX;
      numberOfTurns++;
      if (numberOfTurns == 9 || game.checkWinner() != "Draw") {
        isGameOver = true;
      }

      gameResult = "The Winner is ${game.checkWinner()}";
    });
  }
}
