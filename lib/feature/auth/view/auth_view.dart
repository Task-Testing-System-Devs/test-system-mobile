import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_elevated_button.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_text_field.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Авторизация',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            AppTextField(
              controller: emailController,
              hintText: 'abivanov@edu.hse.ru',
            ),
            SizedBox(
              height: 16.h,
            ),
            AppTextField(
              controller: passwordController,
              hintText: '********',
            ),
            SizedBox(
              height: 16.h,
            ),
            AppElevatedButton(
              text: 'Авторизоваться',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
