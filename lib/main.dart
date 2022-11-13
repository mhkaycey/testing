import 'package:flutter/material.dart';
import 'index.dart';


void main() {
  runApp(
      MaterialApp(
        theme:  ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const baseApp(),
      )
  );
}

