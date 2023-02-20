import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CodeTestSystem());
}

class CodeTestSystem extends StatefulWidget {
  const CodeTestSystem({Key? key}) : super(key: key);

  @override
  State<CodeTestSystem> createState() => _CodeTestSystemState();
}

class _CodeTestSystemState extends State<CodeTestSystem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
