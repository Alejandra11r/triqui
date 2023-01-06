import 'package:flutter/material.dart';
import 'package:triqui/widgets/widgets.dart';

class PlayTitle extends StatelessWidget {
  const PlayTitle({super.key});
  @override
  Widget build(BuildContext context) {
    TriquiInheritedWidget triquiInheritedWidget =
        TriquiInheritedWidget.of(context)!;
    return TextButton(
        onPressed: () {
          if (triquiInheritedWidget.triquiController.getPlays == 0) {
            triquiInheritedWidget.triquiController.clearBoard();
          } else {
            triquiInheritedWidget.triquiController.clearBoard();
            triquiInheritedWidget.triquiController.restartPlays();
          }
          triquiInheritedWidget.updateState();
        },
        child: Text(
          triquiInheritedWidget.triquiController.getPlays == 0
              ? 'Iniciar Partida'
              : 'Reiniciar',
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Color.fromRGBO(28, 27, 31, 1)),
        ));
  }
}
