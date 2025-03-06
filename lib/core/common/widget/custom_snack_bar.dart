import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(
     SnackBar(
       content: Text(text),
      // duration: const Duration(seconds: 2),
     ),
 
  );

}