import 'dart:math';

class Player{
  static String playerX = "X";
  static String playerO = "O";
  static String empty = " ";
  static List<int> playerXPlayedIndices = [];
  static List<int> playerOPlayedIndices = [];
}

extension ContainsAllIndices on List{
  bool containsAll(int index1, int index2, [index3]){
    return index3 == null? contains(index1) && contains(index2) : contains(index1) && contains(index2) && contains(index3);
  }
}

class Game{
  void playGame(int index, String activePlayer) {
    activePlayer == Player.playerX ? Player.playerXPlayedIndices.add(index) : Player.playerOPlayedIndices.add(index);
  }

  Future<void> autoPlay(String activePlayer) async{
    int indexToPlay = 0;
    List<int> availableIndices = [];

    for(int i = 0; i<9 ; i++){
      if( !Player.playerXPlayedIndices.contains(i) && !Player.playerOPlayedIndices.contains(i)){
        availableIndices.add(i);
      }
    }

    ///Win
    if(Player.playerOPlayedIndices.containsAll(0, 1) && availableIndices.contains(2)){
    indexToPlay = 2;
    } else if(Player.playerOPlayedIndices.containsAll(3, 4) && availableIndices.contains(5)){
    indexToPlay = 5;
    }else if(Player.playerOPlayedIndices.containsAll(6, 7) && availableIndices.contains(8)){
    indexToPlay = 8;
    }else if(Player.playerOPlayedIndices.containsAll(0, 3) && availableIndices.contains(6)){
    indexToPlay = 6;
    }else if(Player.playerOPlayedIndices.containsAll(1, 4) && availableIndices.contains(7)){
    indexToPlay = 7;
    }else if(Player.playerOPlayedIndices.containsAll(2, 5) && availableIndices.contains(8)){
    indexToPlay = 8;
    }else if(Player.playerOPlayedIndices.containsAll(0, 4) && availableIndices.contains(8)){
    indexToPlay = 8;
    }else if(Player.playerOPlayedIndices.containsAll(2, 4) && availableIndices.contains(6)){
    indexToPlay = 6;
    }
    //center-end
    else if(Player.playerOPlayedIndices.containsAll(1, 2) && availableIndices.contains(0)){
    indexToPlay = 0;
    }else if(Player.playerOPlayedIndices.containsAll(4, 5) && availableIndices.contains(3)){
    indexToPlay = 3;
    }else if(Player.playerOPlayedIndices.containsAll(7, 8) && availableIndices.contains(6)){
    indexToPlay = 6;
    }else if(Player.playerOPlayedIndices.containsAll(3, 6) && availableIndices.contains(0)){
    indexToPlay = 0;
    }else if(Player.playerOPlayedIndices.containsAll(4, 7) && availableIndices.contains(1)){
    indexToPlay = 1;
    }else if(Player.playerOPlayedIndices.containsAll(5, 8) && availableIndices.contains(2)){
    indexToPlay = 2;
    }else if(Player.playerOPlayedIndices.containsAll(4, 8) && availableIndices.contains(0)){
    indexToPlay = 0;
    }else if(Player.playerOPlayedIndices.containsAll(4, 6) && availableIndices.contains(2)){
    indexToPlay = 2;
    }
    //start-end
    else if(Player.playerOPlayedIndices.containsAll(0, 2) && availableIndices.contains(1)){
    indexToPlay = 1;
    } else if(Player.playerOPlayedIndices.containsAll(3, 5) && availableIndices.contains(4)){
    indexToPlay = 4;
    }else if(Player.playerOPlayedIndices.containsAll(6, 8) && availableIndices.contains(7)){
    indexToPlay = 7;
    }else if(Player.playerOPlayedIndices.containsAll(0, 6) && availableIndices.contains(3)){
    indexToPlay = 3;
    }else if(Player.playerOPlayedIndices.containsAll(1, 7) && availableIndices.contains(4)){
    indexToPlay = 4;
    }else if(Player.playerOPlayedIndices.containsAll(2, 8) && availableIndices.contains(5)){
    indexToPlay = 5;
    }else if(Player.playerOPlayedIndices.containsAll(0, 8) && availableIndices.contains(4)){
    indexToPlay = 4;
    }else if(Player.playerOPlayedIndices.containsAll(2, 6) && availableIndices.contains(4)){
    indexToPlay = 4;
    }
    ///Protect
    //start-center
    else if(Player.playerXPlayedIndices.containsAll(0, 1) && availableIndices.contains(2)){
      indexToPlay = 2;
    } else if(Player.playerXPlayedIndices.containsAll(3, 4) && availableIndices.contains(5)){
      indexToPlay = 5;
    }else if(Player.playerXPlayedIndices.containsAll(6, 7) && availableIndices.contains(8)){
      indexToPlay = 8;
    }else if(Player.playerXPlayedIndices.containsAll(0, 3) && availableIndices.contains(6)){
      indexToPlay = 6;
    }else if(Player.playerXPlayedIndices.containsAll(1, 4) && availableIndices.contains(7)){
      indexToPlay = 7;
    }else if(Player.playerXPlayedIndices.containsAll(2, 5) && availableIndices.contains(8)){
      indexToPlay = 8;
    }else if(Player.playerXPlayedIndices.containsAll(0, 4) && availableIndices.contains(8)){
      indexToPlay = 8;
    }else if(Player.playerXPlayedIndices.containsAll(2, 4) && availableIndices.contains(6)){
      indexToPlay = 6;
    }
    //center-end
    else if(Player.playerXPlayedIndices.containsAll(1, 2) && availableIndices.contains(0)){
      indexToPlay = 0;
    }else if(Player.playerXPlayedIndices.containsAll(4, 5) && availableIndices.contains(3)){
      indexToPlay = 3;
    }else if(Player.playerXPlayedIndices.containsAll(7, 8) && availableIndices.contains(6)){
      indexToPlay = 6;
    }else if(Player.playerXPlayedIndices.containsAll(3, 6) && availableIndices.contains(0)){
      indexToPlay = 0;
    }else if(Player.playerXPlayedIndices.containsAll(4, 7) && availableIndices.contains(1)){
      indexToPlay = 1;
    }else if(Player.playerXPlayedIndices.containsAll(5, 8) && availableIndices.contains(2)){
      indexToPlay = 2;
    }else if(Player.playerXPlayedIndices.containsAll(4, 8) && availableIndices.contains(0)){
      indexToPlay = 0;
    }else if(Player.playerXPlayedIndices.containsAll(4, 6) && availableIndices.contains(2)){
      indexToPlay = 2;
    }
    //start-end
    else if(Player.playerXPlayedIndices.containsAll(0, 2) && availableIndices.contains(1)){
      indexToPlay = 1;
    } else if(Player.playerXPlayedIndices.containsAll(3, 5) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(6, 8) && availableIndices.contains(7)){
      indexToPlay = 7;
    }else if(Player.playerXPlayedIndices.containsAll(0, 6) && availableIndices.contains(3)){
      indexToPlay = 3;
    }else if(Player.playerXPlayedIndices.containsAll(1, 7) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(2, 8) && availableIndices.contains(5)){
      indexToPlay = 5;
    }else if(Player.playerXPlayedIndices.containsAll(0, 8) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(2, 6) && availableIndices.contains(4)){
      indexToPlay = 4;
    }
    ///SMART
    else if(Player.playerXPlayedIndices.containsAll(0, 7) && availableIndices.contains(4)){
      indexToPlay = 4;
    } else if(Player.playerXPlayedIndices.containsAll(2, 7) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(6, 1) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(8, 1) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(3, 2) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(3, 8) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(5, 0) && availableIndices.contains(4)){
      indexToPlay = 4;
    }else if(Player.playerXPlayedIndices.containsAll(5, 6) && availableIndices.contains(4)){
      indexToPlay = 4;
    }
   else{
      Random random = Random();
      int randomIndex = random.nextInt(availableIndices.length);
      indexToPlay = availableIndices[randomIndex];
    }

   activePlayer == Player.playerX? Player.playerXPlayedIndices.add(indexToPlay) : Player.playerOPlayedIndices.add(indexToPlay);
  }

  String checkWinner(){
    if( Player.playerXPlayedIndices.containsAll(0, 1, 2) ||
        Player.playerXPlayedIndices.containsAll(3, 4, 5) ||
        Player.playerXPlayedIndices.containsAll(6, 7, 8) ||
        Player.playerXPlayedIndices.containsAll(0, 3, 6) ||
        Player.playerXPlayedIndices.containsAll(1, 4, 7) ||
        Player.playerXPlayedIndices.containsAll(2, 5, 8) ||
        Player.playerXPlayedIndices.containsAll(0, 4, 8) ||
        Player.playerXPlayedIndices.containsAll(2, 4, 6)
    ){
      return Player.playerX;
    }else if( Player.playerOPlayedIndices.containsAll(0, 1, 2) ||
        Player.playerOPlayedIndices.containsAll(3, 4, 5) ||
        Player.playerOPlayedIndices.containsAll(6, 7, 8) ||
        Player.playerOPlayedIndices.containsAll(0, 3, 6) ||
        Player.playerOPlayedIndices.containsAll(1, 4, 7) ||
        Player.playerOPlayedIndices.containsAll(2, 5, 8) ||
        Player.playerOPlayedIndices.containsAll(0, 4, 8) ||
        Player.playerOPlayedIndices.containsAll(2, 4, 6)
    ){
      return Player.playerO;
    }else{
      return "Draw";
    }
  }
}