import 'package:flutter/material.dart';
import 'package:triqui/pages/home_page.dart';
import 'package:triqui/pages/triqui_page.dart';
import 'package:triqui/widgets/widgets.dart';

import 'controller/triqui_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  updateState(){
    setState(() {
    });
  }

  final TriquiController triquiController = TriquiController();
  @override
  Widget build(BuildContext context) {
    return TriquiInheritedWidget(
         updateState: updateState,
        triquiController: triquiController,
        plays: triquiController.getPlays,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(104, 68, 132, 1),
          canvasColor: const Color.fromRGBO(208, 188, 255, 1),
          fontFamily: 'Poppins',
        ),
        home: const HomePage(),
        routes: {
          'home': (_) => const HomePage(),
          'triqui': (_) => const TriquiPage()
        },
      ),
    );
  }
}
