import 'package:flutter/material.dart';
import 'package:ordertakingapp/util/Colors.dart';

class Button extends StatelessWidget {
  final String title;

  Button({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: MyColors.mainColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}

