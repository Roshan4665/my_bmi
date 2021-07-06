import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.result, this.age, this.gender});

  final bmi, result, age, gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Your Result',
                textScaleFactor: 2,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 5,
              child: MyCard(
                col: kActive,
                childwidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        'Result',
                        textScaleFactor: 2,
                        style: TextStyle(color: Color(0xff22E37A)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        bmi,
                        textScaleFactor: 8,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Your body weight is ' + result,
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        gender == 0 ? gr : gr2,
                        // textScaleFactor: 1,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Color(0xff22E37A)),
                      ),
                    ),
                    // Container(
                    //   child: Text(
                    //     ar,
                    //     textScaleFactor: 1.2,
                    //     textAlign: TextAlign.justify,
                    //     style: TextStyle(color: Color(0xff22E37A)),
                    //   ),
                    //)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                    child: Text(
                  'RECALCULATE',
                  textScaleFactor: 1.6,
                )),
              ),
            )
          ],
        ));
  }
}
