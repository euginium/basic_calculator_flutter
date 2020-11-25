import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  CalcButton({this.buttonTapped, this.buttonText, this.buttonColor});

  String buttonText;
  final buttonTapped;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: ClipRRect(
          child: Container(
            color: buttonColor,
            child: InkWell(
              onTap: buttonTapped,
              highlightColor: Colors.red,
              splashColor: Colors.red,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
