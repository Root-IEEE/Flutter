import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function validator;
  final Function? onFieldSubmitted;
  final Function? onChanged;
  final bool isPassword;
  final Function? suffixPressed;
  final Color cursorColor;
  final Function()? onTap;

  const DefaultTextField({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.isPassword = false,
    this.suffixPressed,
    this.cursorColor = Colors.black,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      obscureText: isPassword,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[120],
        // Background color
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
        hintText: labelText,

      ),
      validator: (value) {
        return validator(value);
      },
      onFieldSubmitted: (value) {
        onFieldSubmitted?.call(value);
      },
      onTap: onTap,
    );
  }
}
