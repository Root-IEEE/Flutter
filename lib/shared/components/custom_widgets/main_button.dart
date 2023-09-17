import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  final bool enabled;
  final Color? color;
  final double height;
  final double width;
  final double radius;

  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.enabled = true,
    this.color,
    this.height = 50.0,
    this.width = 200.0,
    this.radius = 10.0,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: AppColors.mainColor,
            backgroundColor: enabled ? color : color?.withOpacity(0.5),
          ),
          onPressed: enabled ? onTap : null,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
