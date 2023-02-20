import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/auth/view/auth_view.dart';

class CodeTestSystem extends StatefulWidget {
  const CodeTestSystem({Key? key}) : super(key: key);

  @override
  State<CodeTestSystem> createState() => _CodeTestSystemState();
}

class _CodeTestSystemState extends State<CodeTestSystem> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return const MaterialApp(
          home: AuthView(),
        );
      },
    );
  }
}
