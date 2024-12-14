import 'package:flutter/material.dart';

final ThemeData pastelTheme = ThemeData(
  primaryColor: Colors.pink[200], // Pastel Pink for primary elements
  hintColor: Colors.green[200], // Pastel Mint Green for buttons and highlights
  scaffoldBackgroundColor:
      Colors.white, // Clean white background to let pastel colors pop
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.pink[200], // Pastel Pink for AppBar
    titleTextStyle: TextStyle(
      color: Colors.white, // White text for clear contrast in the AppBar
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    displayLarge:
        TextStyle(color: Colors.pink[200], fontWeight: FontWeight.bold),
    bodyLarge:
        TextStyle(color: Colors.pink[600]), // A deeper pink for body text
    bodyMedium: TextStyle(
        color: Colors.pink[500]), // Slightly lighter pink for other text
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green[200], // Pastel Mint Green for buttons
    textTheme: ButtonTextTheme.primary, // Button text in white for contrast
  ),
  iconTheme: IconThemeData(
    color: Colors.green[200], // Pastel Mint Green icons for consistency
  ),
);
