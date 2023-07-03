import 'package:flutter/material.dart';

class GameLogic with ChangeNotifier {
  List<String> boardFields = List<String>.filled(9, "", growable: false);
  String activePlayer = "X";
  String gameResult = "";
  bool isGameOver = false;
  int numberOfTurns = 0;

  void playGame({required int index}) {
    if(!isGameOver && isAvailableField(index: index)) {
      bookField(index: index);
      numberOfTurns++;
      checkForWinner();
      checkForDraw();
      switchPlayer();
    }

    notifyListeners();
  }

  isAvailableField({required int index}) {
    return boardFields[index] == "";
  }

  bookField({required int index}) {
    boardFields[index] = activePlayer;
  }

  checkForWinner() {
    List<List<int>> winningCases = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for(int i = 0; i < winningCases.length; i++) {
      if(boardFields[winningCases[i][0]] != "" &&
          boardFields[winningCases[i][0]] == boardFields[winningCases[i][1]] &&
          boardFields[winningCases[i][1]] == boardFields[winningCases[i][2]]) {
        setGameResult(result: activePlayer);
      }
    }
  }

  setGameResult({required String result}) {
    gameResult = result;
    isGameOver = true;
  }

  checkForDraw() {
    if(numberOfTurns == 9 && gameResult == "") {
      setGameResult(result: "Draw");
    }
  }

  switchPlayer() {
    activePlayer = activePlayer == "X" ? "O" : "X";
  }

  resetGame() {
    boardFields = List<String>.filled(9, "", growable: false);
    activePlayer = "X";
    gameResult = "";
    isGameOver = false;
    numberOfTurns = 0;

    notifyListeners();
  }
}
