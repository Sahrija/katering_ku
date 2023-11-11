import 'package:flutter/material.dart';

class Style {
  static Color? backgroundColor = Colors.grey[100];
  static BoxShadow boxShadow = BoxShadow(
    blurRadius: 10,
    spreadRadius: 10,
    color: Color.fromRGBO(0, 0, 0, 0.039),
  );
  static BorderRadius borderRadius = BorderRadius.all(Radius.circular(5));
}

class Component {
  static Text headerText(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
