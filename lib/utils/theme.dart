import 'package:flutter/material.dart';

ThemeData myTheme() => ThemeData(
  primarySwatch: Colors.purple,
  textTheme:
  const TextTheme(headline3: TextStyle(fontSize: 24, color: Colors.purple)),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(fontWeight: FontWeight.bold),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50), right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50), right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.purple),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50), right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.red),
    ),

  ),
);