import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      onTap: () {},
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
