import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({this.col, this.childwidget});

  final Color? col;
  final Widget? childwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: childwidget,
      decoration: BoxDecoration(
        color: col == null ? Color(0xFF1D1E33) : col,
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Colors.pink.shade500,
        //       Colors.pink.shade600,
        //       Colors.purple.shade600,
        //     ]),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
