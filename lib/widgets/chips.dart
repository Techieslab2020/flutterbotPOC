
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {

    final String text;

    CustomChoiceChip({this.text});

    @override
    Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
    );
   }
   }