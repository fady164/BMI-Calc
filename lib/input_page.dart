import 'calcbrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'cardcontent.dart';
import 'constraction.dart';
import 'iconcontent.dart';

enum Gender {
  male,
  female,
}

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  // Color malecardcolor = inactivecolorbox;
  // Color femalecardcolor= inactivecolorbox;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                      print("male");
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? activecolorbox
                      : inactivecolorbox,
                  cardchild:
                      iconind(iconget: FontAwesomeIcons.mars, textget: 'MALE'),
                )),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                          print("Female");
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activecolorbox
                          : inactivecolorbox,
                      cardchild: iconind(
                          iconget: FontAwesomeIcons.venus, textget: 'FEMALE')),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activecolorbox,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labeltext,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: bigtext,
                      ),
                      Text(
                        'cm',
                        style: labeltext,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      thumbColor: Color(0xffeb1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      overlayColor: Color(0x29eb1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activecolorbox,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labeltext,
                        ),
                        Text(
                          weight.toString(),
                          style: bigtext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn2",
                              child: Icon(FontAwesomeIcons.minus),
                              backgroundColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: "btn3",
                              child: Icon(FontAwesomeIcons.plus),
                              backgroundColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activecolorbox,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labeltext,
                        ),
                        Text(
                          age.toString(),
                          style: bigtext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn4",
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              heroTag: "btn5",
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalcBrain calc = CalcBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Resultpage(
                            bmicalc: calc.calculatebmi(),
                            bmihelp: calc.gethelp(),
                            bmitext: calc.getresult(),
                          )));
            },
            child: Hero(
              tag: 'heroo1',
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
