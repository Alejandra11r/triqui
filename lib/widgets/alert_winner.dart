import 'package:flutter/material.dart';
import 'package:triqui/widgets/widgets.dart';

class AlertWinner extends StatelessWidget {
  const AlertWinner({
    Key? key,
    required this.contextAlert,
  }) : super(key: key);
  final BuildContext contextAlert;
  @override
  Widget build(BuildContext context) {
    TriquiInheritedWidget triquiInheritedWidget =
        TriquiInheritedWidget.of(contextAlert)!;
    final winner = triquiInheritedWidget.triquiController.getWinner;
    final plays = triquiInheritedWidget.triquiController.getPlays;

    return AlertDialog(
      backgroundColor: const Color.fromRGBO(234, 221, 255, 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      content: SizedBox(
        width: 345,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              plays == 9
                  ? Icons.android_outlined
                  : Icons.account_circle_rounded,
              size: 40,
            ),
            Text(
              plays == 9
                  ? "Nadie Gana"
                  : 'Ganador \n Jugador ${winner.isNotEmpty ? winner[0] : ''}',
              style: const TextStyle(
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
