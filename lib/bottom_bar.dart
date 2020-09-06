import 'package:flutter/material.dart';
import 'constants.dart';

class BottomBar extends StatelessWidget {

  final String title;
  final Function onTap;

  BottomBar({this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPrimaryColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 28),)),
      ),
    );
  }
}