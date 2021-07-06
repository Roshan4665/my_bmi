import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0E21)),
      home: InputPage(),
      routes: {
        './': (context) => InputPage(),
        './results': (context) => ResultPage()
      },
    );
  }
}
