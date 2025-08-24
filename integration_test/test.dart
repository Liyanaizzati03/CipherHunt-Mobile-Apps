import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:cipher_hunt/flutter_flow/flutter_flow_icon_button.dart';
import 'package:cipher_hunt/flutter_flow/flutter_flow_widgets.dart';
import 'package:cipher_hunt/flutter_flow/flutter_flow_theme.dart';
import 'package:cipher_hunt/index.dart';
import 'package:cipher_hunt/main.dart';
import 'package:cipher_hunt/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:cipher_hunt/backend/firebase/firebase_config.dart';
import 'package:cipher_hunt/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FFLocalizations.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('test1', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'liyanaz0190@gmail.com', password: 'Liyana098');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: MainMenuWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_ed5o')), 'email');
    await tester.enterText(
        find.byKey(const ValueKey('password_h9hl')), 'password');
    await tester.tap(find.byKey(const ValueKey('Button_jpl1')));
    await tester.tap(find.byKey(const ValueKey('PLAY_cxtf')));
    await tester.tap(find.byKey(const ValueKey('Setting_0gt1')));
    await tester.tap(find.byKey(const ValueKey('INFO_n34g')));
    await tester.tap(find.byKey(const ValueKey('exitApp_6t2t')));
    await tester.tap(find.byKey(const ValueKey('caeser_4v5n')));
    await tester.tap(find.byKey(const ValueKey('Container_xxwx')));
    await tester.tap(find.byKey(const ValueKey('corectOption_qaot')));
    await tester.tap(find.byKey(const ValueKey('Button_4nlp')));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
