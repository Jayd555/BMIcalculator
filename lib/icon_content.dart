import 'package:flutter/material.dart';
import 'constant.dart';

class IconWidget extends StatelessWidget {
  IconWidget({ this.icon , this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:<Widget>[
          Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(label, style: kLabelTextStyle,
          ),

        ]
    );
  }
}
