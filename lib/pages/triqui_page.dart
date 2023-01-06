import 'package:flutter/material.dart';
import 'package:triqui/widgets/widgets.dart';


GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
class TriquiPage extends StatelessWidget {
  const TriquiPage({super.key});

  @override
  Widget build(BuildContext context) {
    TriquiInheritedWidget triquiInheritedWidget =
        TriquiInheritedWidget.of(context)!;
        final showWinner = triquiInheritedWidget.triquiController.getIsShowWinner;
    return Scaffold(
        key: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.only(top: 120, bottom: 20),
          child: Column(
            children: [
              const PlayersButtons(),
              const SizedBox(
                height: 40,
              ),
              if (!showWinner)
                const PlayTitle(),
              const SizedBox(
                height: 30,
              ),
              if (!showWinner)
                const GridTriqui(),
              const SizedBox(
                height: 20,
              ),
              if (!showWinner)
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
                    
                    triquiInheritedWidget.triquiController.restartGame();
                  },
                  icon: const Icon(Icons.home),
                  color: Theme.of(context).primaryColor,
                ),
              const Expanded(child: SizedBox()),
              const Footer()
            ],
          ),
        ));
  }
}
