import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class SectionButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback onTap;

  const SectionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.lightBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Text(
              text,
              style: AppTextStyles.body16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
