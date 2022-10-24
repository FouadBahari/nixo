import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String title;
  bool obscureText;
  TextEditingController textController;
  String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.title,
    required this.textController,
    required this.validator,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: widget.validator,
      decoration: InputDecoration(
          labelText: widget.title,
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isShowPassword = !_isShowPassword;
                    });
                  },
                  child: Icon(_isShowPassword == false
                      ? Icons.visibility
                      : Icons.visibility_off))
              : const SizedBox()),
      obscureText: widget.obscureText ? _isShowPassword : widget.obscureText,
    );
  }
}
