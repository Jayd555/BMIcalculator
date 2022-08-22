import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/BottomButton.dart';



class ResultPage  extends StatelessWidget {
ResultPage({@required this.bmiResult,@required this.resultText, @required this.interpreterText});
  final  bmiResult;
  final resultText;
  final interpreterText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('BMI CALCULATOR'),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
      child:Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.bottomLeft,
        child:Text(
                'Your Result',
                style: kLittleTextStyle,
              ),
          ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour:kWidgetColor,
              cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(resultText,
              style:kResultTestStyle,
              ),
              Text(bmiResult,
              style: kBMITextStyle,
              ),
              Text(interpreterText,
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
              ),
            ],
              ),
              ),
            ),
          BottomButton(onTap: ()
            {
              Navigator.pop(context);
            },buttonTitle: 'RE-CALCULATE'),


        ],
      )

    );
  }
}
