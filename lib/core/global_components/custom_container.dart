import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final double borderRadius;

  const CustomContainer({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.trailingIcon,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.iconColor = Colors.grey,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(leadingIcon, color: iconColor),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8.0),
          Icon(trailingIcon, color: iconColor),
        ],
      ),
    );
  }
}
