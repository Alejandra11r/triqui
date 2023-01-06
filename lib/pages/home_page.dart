import 'package:flutter/material.dart';
import 'package:triqui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
        TriquiInheritedWidget triquiInheritedWidget =
        TriquiInheritedWidget.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 210, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            const Text(
              'Triqui',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 34,
                  color: Color.fromRGBO(28, 27, 31, 1)),
            ),
            const SizedBox(height: 60,),
            // ButtonAction(text: '1 Jugador', onPressed: (){
            //   triquiInheritedWidget.triquiController.setCantPlayers(1);
            //   Navigator.pushNamed(context, 'triqui');
            // },),
            const SizedBox(height: 20,),
            ButtonAction(text: '2 Jugadores', onPressed: (){
              triquiInheritedWidget.triquiController.setCantPlayers(2);
              Navigator.pushNamed(context, 'triqui');
            },),
            const Expanded(child: SizedBox()),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
