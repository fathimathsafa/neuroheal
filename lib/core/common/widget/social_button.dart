 import 'package:flutter/material.dart';

Widget socialButton({
    required String text,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.network(imageUrl, height: 24, width: 24),
      label: Text(text, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Color.fromARGB(255, 240, 238, 238)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: 0,
      ),
    );
  }