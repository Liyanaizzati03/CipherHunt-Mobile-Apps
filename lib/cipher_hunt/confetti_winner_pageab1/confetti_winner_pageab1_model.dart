import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confetti_winner_pageab1_widget.dart' show ConfettiWinnerPageab1Widget;
import 'package:flutter/material.dart';

class ConfettiWinnerPageab1Model
    extends FlutterFlowModel<ConfettiWinnerPageab1Widget> {
  ///  Local state fields for this page.

  List<String> options = ['Apples', 'Oranges', 'Grapes'];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
