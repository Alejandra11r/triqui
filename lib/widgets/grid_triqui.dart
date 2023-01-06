import 'package:flutter/material.dart';
import 'package:triqui/widgets/widgets.dart';


class GridTriqui extends StatelessWidget {
  const GridTriqui({super.key});

  @override
  Widget build(BuildContext context) {
    TriquiInheritedWidget triquiInheritedWidget =
        TriquiInheritedWidget.of(context)!;
    return SizedBox(
      width: 320,
      height: 360,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: triquiInheritedWidget.triquiController.getBoxes.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (triquiInheritedWidget.triquiController
                  .isOnPressedActivated(index)) {
                triquiInheritedWidget.triquiController
                    .move(triquiInheritedWidget, index);
              }
              triquiInheritedWidget.updateState();
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: triquiInheritedWidget.triquiController
                    .borders(index, context),
              ),
              child: Icon(
                triquiInheritedWidget.triquiController.oneBox(index)[1],
                color:
                    triquiInheritedWidget.triquiController.oneBox(index)[0] == 1
                        ? const Color.fromRGBO(152, 220, 244, 1)
                        : Colors.white,
                size: 80,
              ),
            ),
          );
        },
      ),
    );
  }
}
