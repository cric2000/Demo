import 'package:flutter/material.dart';


class DashContent extends StatelessWidget {
  final Color color;

  DashContent(this.color);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
    );
  }
}