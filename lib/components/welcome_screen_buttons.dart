import 'package:flutter/material.dart';

class WelcomeScreenButtons extends StatelessWidget {
  WelcomeScreenButtons({@required this.color,this.label, this.onpress });
  final String label;
  final Color color;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}