
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final Widget? suffix;
  final bool isPasswordField;

  const AppTextFormField({
    required this.labelText,
    required this.controller,
    this.suffix,
    this.isPasswordField = false,
    Key? key}) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool? isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = widget.isPasswordField;
    super.initState();
  }

  // InkWell, GestureDetector
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: Visibility(
          visible: widget.isPasswordField,
          child: Visibility(
            visible: widget.isPasswordField,
            child: GestureDetector(
                onTap: (){
                  setState(() {
                    isPasswordVisible= !isPasswordVisible!;
                  });
                },
                child: const Icon(Icons.visibility_outlined)),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(24),

        )
      ),
    );
  }
}
