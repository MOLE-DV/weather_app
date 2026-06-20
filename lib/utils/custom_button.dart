import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  Icon? icon;
  final Widget child;
  CustomButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Row(spacing: 10, children: [if (icon != null) icon!, child]),
    );
  }
}
