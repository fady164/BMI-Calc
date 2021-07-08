import 'package:bmi/cardcontent.dart';
import 'package:bmi/input_page.dart';
import 'constraction.dart';
import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  Resultpage({@required this.bmicalc, this.bmihelp, this.bmitext});

  final String bmicalc;
  final String bmitext;
  final String bmihelp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableCard(
                colour: activecolorbox,
                cardchild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmitext,
                      style: resulttextstyle,
                    ),
                    Text(
                      bmicalc,
                      style: bmitextstyle,
                    ),
                    Text(
                      bmihelp,
                      textAlign: TextAlign.center,
                      style: kbodytextstyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Inputpage()));
            },
            child: Hero(
              tag: 'heroo5',
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
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
          ),
        ],
      ),
    );
  }
}
