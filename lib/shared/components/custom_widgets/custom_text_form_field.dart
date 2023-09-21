import 'package:e_learning/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? prefixIcon; // Change the type to Widget?
  final Widget? suffixIcon; // Change the type to Widget?
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
    this.prefixIcon, // Change the type to Widget?
    this.suffixIcon, // Change the type to Widget?
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
    return SizedBox(
      height: 50,
      child: TextFormField(
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: prefixIcon,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: suffixIcon!,
                  onPressed: () {
                    suffixPressed!();
                  },
                )
              : null,
          hintText: labelText,

          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.w400, color: AppColors.purpleGrey,),
        ),
        validator: (value) {
          return validator(value);
        },
        onFieldSubmitted: (value) {
          onFieldSubmitted?.call(value);
        },
        onTap: onTap,
      ),
    );
  }
}
