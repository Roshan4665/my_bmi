import 'package:flutter/material.dart';

class BoxContents extends StatelessWidget {
  BoxContents({@required this.mainIcon, @required this.mainText});

  final mainIcon;
  final mainText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Icon(
            mainIcon,
            size: 80,
          ),
          fit: BoxFit.fitHeight,
        ),
        Text(
          mainText,
          textScaleFactor: 2,
        )
      ],
    );
  }
}
