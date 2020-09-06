import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_container.dart';
import 'bottom_bar.dart';
import 'bmi_calculation.dart';

class Result extends StatelessWidget {


  Result({this.getCalculation,this.getInterpretation,this.getResult});

  String getCalculation;
  String getResult ;
String getInterpretation ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: kCardNumberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              cardColor: kActiveCardColor,
              margin: EdgeInsets.all(16),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Center(child: Text(getResult,style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w500),)),),
                  Expanded(child: Text(getCalculation,style: TextStyle(color: kTextColor,fontSize: 100,fontWeight: FontWeight.w900),),),
                  Expanded(child: Text(getInterpretation,style: TextStyle(color: kTextColor,fontSize: 22),),),
                ],
              ),
            ),
          ),
          BottomBar(title: 'Re-Calculate',onTap: () {
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
