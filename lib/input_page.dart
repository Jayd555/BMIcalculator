import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'result_page.dart';
import 'BottomButton.dart';
import 'calculator_brain.dart';


enum Gender{
Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height=180;
  int weight=60;
  int age=20;
  Gender selectedGender;
  // Color maleCardColor=inactiveCardColour;
  // Color femaleCardColor=inactiveCardColour;
  //
  //
  // void updatecolor(Gender selectedgender){
  //   if (selectedgender==Gender.Male){
  //     if(maleCardColor==inactiveCardColour){
  //       maleCardColor=WidgetColor;
  //       femaleCardColor=inactiveCardColour;
  //     }
  //     else{
  //       maleCardColor=inactiveCardColour;
  //
  //     }
  //   }
  //   if (selectedgender==Gender.Female){
  //     if(femaleCardColor==inactiveCardColour){
  //       femaleCardColor=WidgetColor;
  //       maleCardColor=inactiveCardColour;
  //     }
  //     else{
  //       femaleCardColor=inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children:<Widget>[
          Expanded(child: Row(
          children:<Widget>[
            Expanded(
              child: ReusableCard(
              onPress:(){
              setState(() {
              selectedGender=Gender.Male;
              });
              },
                  colour:selectedGender==Gender.Male? kWidgetColor : kInactiveCardColour,
                  cardChild: IconWidget(icon: FontAwesomeIcons.mars,label: 'Male',),
              ),
            ),

             Expanded(child:ReusableCard(
               onPress: (){
                 setState(() {
                 selectedGender=Gender.Female;
                 });
               },

                 colour:selectedGender==Gender.Female? kWidgetColor : kInactiveCardColour,
                    cardChild: IconWidget(icon: FontAwesomeIcons.venus,label: 'Female',),
               ),

               ),
             ]
          )),
          Expanded(child: ReusableCard(
              colour:kWidgetColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Height',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                  Text(
                      height.toString(),
                  style: kNumberTextStyle,
                  ),
                    Text(
                      'cm',
                    style: kLabelTextStyle,
                    ),
            ]
          ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0 ),
                        overlayShape:
                          RoundSliderOverlayShape(overlayRadius:30.0 ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max:240.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });

                        })
                    ),],
            ),
          )
          ),
          Expanded(child:Row(
          children:<Widget>[
          Expanded(child: ReusableCard(
              colour:kWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Weight',style: kLabelTextStyle,),
                  Text(weight.toString(),style: kNumberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                 RoundIconButton(
                   icon: FontAwesomeIcons.minus,
                   onPressed:()
                     {
                       setState(() {
                       weight--;
                     });
                     }
                 ),
                  SizedBox(width: 10.0,),
                  RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                      onPressed:()
                      {
                        setState(() {
                          weight++;
                        });
                      }
                  )

                  ],
                  )],)
                  ),
            
          ),
          Expanded(child: ReusableCard(
              colour:kWidgetColor,
              cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Age',style: kLabelTextStyle,),
            Text(age.toString(),style: kNumberTextStyle,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed:()
                      {
                        setState(() {
                          age--;
                        });
                      }
                  ),
                  SizedBox(width: 10.0,),
                  RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      onPressed:()
                      {
                        setState(() {
                          age++;
                        });
                      }
                  )

                ]),
    ])),
                  ),
    ],
    ),
      ),
          BottomButton(onTap:()
            {
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmiResult:calc.calculateBMI(),
                resultText:calc.getResult(),
                interpreterText:calc.getInterpretator(),
              )));
                }, buttonTitle: 'CALCULATE')


    ],
      )
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
  constraints: BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
),
      child:Icon(icon),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

