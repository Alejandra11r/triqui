import 'package:flutter/material.dart';
import 'package:triqui/widgets/widgets.dart';

class PlayersButtons extends StatelessWidget {
  const PlayersButtons({super.key});

  List<Color> colorButton(TriquiInheritedWidget triquiInheritedWidget) {
    Color active = const Color.fromRGBO(255, 252, 243, 1);
    Color inactive = const Color.fromRGBO(211, 211, 196, 1);

    if (triquiInheritedWidget.triquiController.getCurrentPlayer == 1) {
      return [active, inactive];
    }
    return [inactive, active];
  }

  @override
  Widget build(BuildContext context) {
    TriquiInheritedWidget triquiInheritedWidget =
        TriquiInheritedWidget.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonAction(
          color: colorButton(triquiInheritedWidget)[0],
          text: 'Jugador 1 O',
        ),
        const SizedBox(
          width: 20,
        ),
        ButtonAction(
          color: colorButton(triquiInheritedWidget)[1],
          text: triquiInheritedWidget.triquiController.getCantPlayers == 1 ? 'Bot X' : 'Jugador 2 X',
        ),
      ],
    );
  }
}

