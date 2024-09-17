import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
      titleTextStyle: TextStyle(
        color: Color(0xFF8B8B8B),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
      titleTextStyle: TextStyle(
        color: Color(0xFF8B8B8B),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
