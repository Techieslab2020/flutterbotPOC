import 'package:flutter/material.dart';
import 'getting_started_screen.dart';




void main() =>  runApp(new MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:GettingStartedScreen()
    );
  }
}

