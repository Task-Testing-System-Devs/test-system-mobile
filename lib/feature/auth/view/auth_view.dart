import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/auth/model/auth_model.dart';
import 'package:hse_lyc_code_test_system/feature/auth/presenter/auth_presenter.dart';
import 'package:hse_lyc_code_test_system/feature/main/view/main_view.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';
import 'package:hse_lyc_code_test_system/service/navigation_service.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_elevated_button.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_text_field.dart';

class AuthView extends StatefulWidget {
  final VoidCallback onSuccessfulAuth;

  const AuthView({
    Key? key,
    required this.onSuccessfulAuth,
  }) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final authPresenter = AuthPresenter();

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
              onPressed: () async {
                final response = await authPresenter.login(
                  AuthModel(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
                if (response != 'Invalid credentials') {
                  if (!mounted) return;
                  widget.onSuccessfulAuth();
                }
                print(response);
              },
            ),
          ],
        ),
      ),
    );
  }
}
