import 'package:flutter/material.dart';

import 'TapEffect.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final double radius, height;
  const RoundButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor: Colors.white,
    this.backgroundColor,
    this.padding,
    this.height = 50,
    this.isClickable = true,
    this.radius = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: TapEffect(
        isClickable: isClickable!,
        onClick: onTap ?? () {},
        child: SizedBox(
          height: height,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: backgroundColor ?? Theme.of(context).primaryColor,
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: buttonTextWidget ??
                    Text(
                      buttonText ?? "",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
