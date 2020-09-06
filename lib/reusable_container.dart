import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final EdgeInsets margin;
  final Widget cardChild;
  final Color cardColor;
  final Function onPress;

  ReusableContainer({this.margin, this.cardChild, this.cardColor, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: this.margin,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
