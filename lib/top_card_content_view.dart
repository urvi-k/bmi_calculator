import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class TopCardContentView extends StatelessWidget {

  final String iconText;
  final IconData icon;

  TopCardContentView({this.icon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 70,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          iconText,
          style: kCardTextStyle,
        ),
      ],
    );
  }
}