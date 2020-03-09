import 'package:flutter/material.dart';
import 'package:myapp/auth.dart';
import 'auth.dart';
import 'utils/myColors.dart';
import 'widgets/body.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  void _signedOut()  {
    try {
      Auth().signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome'),
        actions: <Widget>[
          new FlatButton( child: new Text('SignOut',style: new TextStyle(fontSize:17.0,color:Colors.white ),
          ),
          onPressed:_signedOut,)
        ],
      ),
      body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.white1, MyColors.white2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[ Body()],
          ),
        ),
      ),
    ),
    );
  }





  
  
}
