import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hse_lyc_code_test_system/feature/code_test_system.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const CodeTestSystem());
}
