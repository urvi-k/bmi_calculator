import 'package:calculator/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:calculator/reusable_container.dart';
import 'package:calculator/top_card_content_view.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'custon_round_button.dart';
import 'bottom_bar.dart';
import 'bmi_calculation.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CardType gender;
  int height = 180;
  int weight = 50;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        gender = CardType.male;
                      });
                    },
                    margin: EdgeInsets.fromLTRB(16, 16, 8, 8),
                    cardChild: TopCardContentView(
                      icon: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                    cardColor: gender == CardType.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        gender = CardType.female;
                      });
                    },
                    margin: EdgeInsets.fromLTRB(8, 16, 16, 8),
                    cardChild: TopCardContentView(
                      icon: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                    cardColor: gender == CardType.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kCardNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kCardTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kTextColor,
                            activeTrackColor: Colors.white,
                            thumbColor: kPrimaryColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            trackHeight: 0.3,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 0,
                            max: 300,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    margin: EdgeInsets.fromLTRB(16, 8, 8, 16),
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kCardTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kCardNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CustomRoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            CustomRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    margin: EdgeInsets.fromLTRB(8, 8, 16, 16),
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kCardTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kCardNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CustomRoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            CustomRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
            title: 'Calculate',
            onTap: () {
             var bmi = BmiCalculation(
                  height: this.height, weight: this.weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    getCalculation: bmi.calculateBmi(),getInterpretation: bmi.getInterpretation(),getResult: bmi.getResult() ,
                  ),
                ),
              );
              //Navigator.pushNamed(context, '/result');
            },
          ),
        ],
      ),
    );
  }
}

enum CardType {
  male,
  female,
}
