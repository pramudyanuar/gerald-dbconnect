// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0), // Adjusts the padding around the button
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
        onPressed: onPressed ?? () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
