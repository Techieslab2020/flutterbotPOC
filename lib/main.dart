import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';

void main() =>  runApp(new MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Assistence',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:HomePage()
    );
  }
}

