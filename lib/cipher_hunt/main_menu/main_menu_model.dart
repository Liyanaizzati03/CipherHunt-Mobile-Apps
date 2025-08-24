import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_menu_widget.dart' show MainMenuWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MainMenuModel extends FlutterFlowModel<MainMenuWidget> {
  ///  Local state fields for this page.

  bool musicEnabled = false;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
