import 'package:flutter/material.dart';
import 'constants.dart';

class CustomRoundButton extends StatelessWidget {

  final IconData icon;
  final Function onPress;
  CustomRoundButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor:kTextColor ,
      constraints:
        BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      child: Icon(icon),
      onPressed: onPress,
      elevation: 0.6,
    );
  }
}
