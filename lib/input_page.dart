import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bmi/brain.dart';
import 'package:my_bmi/results_page.dart';
import 'custom_card.dart';
import 'card_contents.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int cardno = 0;
  int height = 175;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        cardno = 1;
                      });
                    },
                    child: MyCard(
                      col: cardno == 1 ? kActive : kInactive,
                      childwidget: BoxContents(
                        mainIcon: Icons.male,
                        mainText: 'MALE',
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        cardno = 2;
                      });
                    },
                    child: MyCard(
                      col: cardno == 2 ? kActive : kInactive,
                      childwidget: BoxContents(
                        mainIcon: Icons.female,
                        mainText: 'FEMALE',
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
              child: MyCard(
                childwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      textScaleFactor: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: kNumLayout,
                        ),
                        Text(
                          'cm',
                          textScaleFactor: 2,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xffADAEBC),
                        thumbColor: Colors.pink,
                        overlayColor: Color(0x30FF0167),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 210,
                          onChanged: (double newheight) {
                            setState(() {
                              height = newheight.toInt();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: MyCard(
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          textScaleFactor: 2,
                        ),
                        Text(
                          '$weight',
                          style: kNumLayout,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircularButton(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            CircularButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: MyCard(
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          textScaleFactor: 2,
                        ),
                        Text(
                          '$age',
                          style: kNumLayout,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            CircularButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator cal = Calculator(height: height, weight: weight);
                var bMi = cal.calculate(height, weight);
                var res = cal.healthParam(bMi);
                //Navigator.pushNamed(context, './results');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: bMi,
                              result: res,
                              age: age,
                              gender: cardno,
                            )));
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                    child: Text(
                  'CALCULATE',
                  textScaleFactor: 1.6,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  CircularButton({@required this.icon, @required this.onPress});

  final onPress;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      //height: 60,
      child: RawMaterialButton(
        constraints: BoxConstraints.tight(Size(40, 40)),
        shape: CircleBorder(),
        fillColor: Color(0xff222747),
        child: Icon(
          icon,
          //size: 40,
        ),
        onPressed: onPress,
      ),
    );
  }
}
