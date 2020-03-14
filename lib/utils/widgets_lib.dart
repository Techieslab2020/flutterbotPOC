import 'package:flutter/material.dart';
import 'myColors.dart';
import '../widgets/dialog_flow.dart';


Widget chatbutton(BuildContext context) {
  return Container(
    alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        child: Center(
          child: Icon(Icons.chat),
        ),
        elevation: 4.0,
        backgroundColor: MyColors.blue1,
        onPressed: () =>  Navigator.push(context,MaterialPageRoute(builder: (context) => FlutterDialogFlow()),
        )
      )
  );
}


