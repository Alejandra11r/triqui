import 'package:flutter/material.dart';
import 'package:triqui/controller/triqui_controller.dart';

class TriquiInheritedWidget extends InheritedWidget {
  const TriquiInheritedWidget(
      {required this.updateState,
      required this.plays,
      required this.triquiController,
      required super.child,
      super.key});

  final TriquiController triquiController;
  final int plays;
  final Function updateState;
  static TriquiInheritedWidget? of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<TriquiInheritedWidget>();
    assert(result != null, 'No TriquiState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TriquiInheritedWidget oldWidget) {
    return plays != oldWidget.plays;
  }
}
