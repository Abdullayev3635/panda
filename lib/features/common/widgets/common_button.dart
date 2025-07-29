
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import 'custom_scale.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    this.color = primaryColor,
    this.radius = 16,
    this.height = 56  ,
    this.margin = EdgeInsets.zero,
    this.textColor = Colors.white,
  });

  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isDisabled;
  final Color color;
  final double radius;
  final double height;
  final EdgeInsets margin;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimation(
      onTap: isDisabled ? () {} : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        height: height,
        width: double.infinity,
        margin: margin,
        child: Center(
          child:
              isLoading
                  ? CupertinoActivityIndicator(color: white)
                  : Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
        ),
      ),
    );
  }
}
