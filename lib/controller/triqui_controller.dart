import 'package:flutter/material.dart';
import 'package:triqui/model/triqui_model.dart';
import 'package:triqui/widgets/widgets.dart';

import '../pages/triqui_page.dart';

class TriquiController {
  TriquiModel triquiModel = TriquiModel();
  int _plays = 0;
  int _cantPlayers = 0;
  bool _isShowWinner = false;
  late List _winner;

  TriquiController(){
    triquiModel = TriquiModel();
  }

  List get getBoxes => triquiModel.getBoxes;
  bool get getIsShowWinner => _isShowWinner;
  int get getCurrentPlayer => triquiModel.getCurrentPlayer;
  int get getPlays => _plays;
  int get getCantPlayers => _cantPlayers;
  List get getWinner => _winner;

  void clearBoard() {
    List boxes = triquiModel.getBoxes;
    for (var i = 0; i < boxes.length; i++) {
      boxes[i][0] = 0;
      boxes[i][1] = const IconData(000000);
    }
    triquiModel.boxes(boxes);
    triquiModel.currentPlayer(1);
    triquiModel.iconPlayer(Icons.clear);
  }

  List oneBox(int box) {
    return getBoxes[box];
  }

  void setBox(int box) {
    getBoxes[box][0] = triquiModel.getCurrentPlayer;
    getBoxes[box][1] = triquiModel.getIconPlayer;
  }

  void setShowWinner(showWinner) {
    _isShowWinner = showWinner;
  }

  void increasePlays() {
    _plays++;
  }

  restartPlays() {
    _plays = 0;
  }

  setPlayer() {
    triquiModel.currentPlayer(triquiModel.getCurrentPlayer == 1 ? 2 : 1);
  }

  setIconPlayer() {
    triquiModel.iconPlayer(triquiModel.getCurrentPlayer == 1
        ? Icons.clear
        : Icons.circle_outlined);
  }

  void setCantPlayers(int cantPlayers) {
    _cantPlayers = cantPlayers;
  }

  defineWinner() {
    for (var i = 0; i < triquiModel.getBoxes.length; i++) {
      List winner = [];
      if (i == 0 || i == 3 || i == 6) {
        if (triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 1][0] &&
            triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 2][0]) {
          winner = triquiModel.getBoxes[i];
        }
      }

      if (i == 0 || i == 1 || i == 2) {
        if (triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 3][0] &&
            triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 6][0]) {
          winner = triquiModel.getBoxes[i];
        }
      }

      if (i == 0) {
        if (triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 4][0] &&
            triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 8][0]) {
          winner = triquiModel.getBoxes[i];
        }
      }

      if (i == 2) {
        if (triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 2][0] &&
            triquiModel.getBoxes[i][0] == triquiModel.getBoxes[i + 4][0]) {
          winner = triquiModel.getBoxes[i];
        }
      }

      if (winner.isNotEmpty && winner[0] != 0) {
        _winner = winner;
        return;
      }
    }

    _winner = [];
  }

  void restartGame() {
    setCantPlayers(0);
    clearBoard();
    triquiModel.currentPlayer(1);
    triquiModel.iconPlayer(Icons.clear);
    restartPlays();
  }

  bool isOnPressedActivated(int index) {
    if (oneBox(index)[0] == 0) {
      if (getCantPlayers == 1) {
        if (getCurrentPlayer == 2) {
          return false;
        }
        return true;
      }
      if (getCantPlayers == 2) {
        return true;
      }
    }
    return false;
  }

  borders(int index, BuildContext context) {
    if (index == 3 || index == 5) {
      return Border.symmetric(
          horizontal:
              BorderSide(width: 7, color: Theme.of(context).primaryColor));
    }
    if (index == 1 || index == 7) {
      return Border.symmetric(
          vertical:
              BorderSide(width: 7, color: Theme.of(context).primaryColor));
    }
    if (index == 4) {
      return Border.all(width: 7, color: Theme.of(context).primaryColor);
    }
  }

  void showWinner(
      TriquiInheritedWidget triquiInheritedWidget, BuildContext context) async {
    setShowWinner(true);
    await showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: ((_) => AlertWinner(
            contextAlert: context,
          )),
    );
    clearBoard();
    restartPlays();
    setShowWinner(false);
    triquiInheritedWidget.updateState();
  }

  void move(TriquiInheritedWidget triquiInheritedWidget, int index) {
    increasePlays();
    if ((getCantPlayers != 0 && getCantPlayers == 1 && getCurrentPlayer == 1) ||
        (getCantPlayers == 2)) {
      setBox(index);
    } else if(getPlays <9){
      final posibleLine = getPossibleLine();
      posibleLine != null ? setBox(posibleLine) : setBox(getEmptyBoxes());
    }
    setPlayer();
    setIconPlayer();
    defineWinner();
    if (getWinner.isNotEmpty || getPlays == 9) {
      showWinner(triquiInheritedWidget, scaffoldKey.currentContext!);
    }
    if (getCurrentPlayer == 2 && getCantPlayers == 1) {
      move(triquiInheritedWidget, 0);
    }
  }

  getEmptyBoxes() {
    for (var i = 0; i < getBoxes.length; i++) {
      if (isEmptyBox(i)) {
        return i;
      }
    }
  }
  bool isEmptyBox(int index) => getBoxes[index][0] == 0;

  getPossibleLine() {
    for (var i = 0; i < getBoxes.length; i++) {
      if (getBoxes[4][0]==0) {
        return 4;
      }
      if (getBoxes[i][0] == 1) {
        //Diagonal cero
        if (i == 0) {
          if (getBoxes[i][0] == getBoxes[i + 4][0] && isEmptyBox(i+8)) {
            return  i + 8;
          }
          if (getBoxes[i][0] == getBoxes[i + 8][0] && isEmptyBox(i+4)) {
            return i + 4;
          }
        }
        //primeras horizontales
        if (i == 0 || i == 1 || i == 2) {
          if (getBoxes[i][0] == getBoxes[i + 6][0] && isEmptyBox(i+3)) {
            return i + 3;
          }
        }
        //centro horizontal
        if (i == 3 || i == 4 || i == 5) {
          if (getBoxes[i][0] == getBoxes[i - 3][0] && isEmptyBox(i+3)) {
            return i + 3;
          }
          if (getBoxes[i][0] == getBoxes[i + 3][0] && isEmptyBox(i-3)) {
            return i - 3;
          }
        }

        //primeras verticales
        if (i == 0 || i == 3 || i == 6) {
          if (getBoxes[i][0] == getBoxes[i + 2][0] && isEmptyBox(i+1)) {
            return i + 1;
          }
        }

        //centro vertical
        if (i == 1 || i == 4 || i == 7) {
          if (getBoxes[i][0] == getBoxes[i - 1][0] && isEmptyBox(i+1)) {
            return i + 1;
          }
          if (getBoxes[i][0] == getBoxes[i + 1][0] && isEmptyBox(i-1)) {
            return i - 1;
          }
        }
        //diagonal 6
        if (i == 6) {
          if (getBoxes[i][0] == getBoxes[i - 2][0] && isEmptyBox(i-4)) {
            return i-4;
          }
          if (getBoxes[i][0] == getBoxes[i - 4][0] && isEmptyBox(i-2)) {
            return i-2;
          }
        }
      }
    }
  }
}
