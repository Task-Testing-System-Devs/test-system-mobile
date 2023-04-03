import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  final MaskTextInputFormatter? inputFormatter;

  const AppTextField({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputFormatter,
    this.hintText = '',
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatter != null ? [widget.inputFormatter!] : null,
      decoration: InputDecoration(
        enabledBorder: _textFieldBorder(Colors.grey[500]!),
        focusedBorder: _textFieldBorder(Colors.black),
        hintText: widget.hintText,
      ),
    );
  }

  OutlineInputBorder _textFieldBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
