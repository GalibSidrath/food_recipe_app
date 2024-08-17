import 'package:flutter/material.dart';

void toastMessege(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(messege),
    ),
  );
}
