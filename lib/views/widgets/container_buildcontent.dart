 import 'package:flutter/material.dart';

Container BuildController(String title, Color color) {
    return Container(
      width: 45.7,
      height: 40,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        '$title',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }