import 'package:flutter/material.dart';

class TriquiModel {
  int _currentPlayer = 1;
  IconData _iconPlayer = Icons.clear;

  List _boxes = [
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
    [0, const IconData(00000)],
  ];

  int get getCurrentPlayer => _currentPlayer;
  IconData get getIconPlayer => _iconPlayer;
  List get getBoxes => _boxes;

  void currentPlayer(int currentPlayer) {
    _currentPlayer = currentPlayer;
  }

  void iconPlayer(IconData iconPlayer) {
    _iconPlayer = iconPlayer;
  }

  void boxes(List boxes) {
    _boxes = boxes;
  }
}
