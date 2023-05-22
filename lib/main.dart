import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hse_lyc_code_test_system/feature/code_test_system.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await SharedPreferencesService.init();
  runApp(const CodeTestSystem());
}
