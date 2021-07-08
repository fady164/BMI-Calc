import 'package:flutter/material.dart';
import 'constraction.dart';

// ignore: camel_case_types
class iconind extends StatelessWidget {
  iconind({this.iconget, this.textget});
  final IconData iconget;
  final String textget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconget,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(textget, style: labeltext)
      ],
    );
  }
}
