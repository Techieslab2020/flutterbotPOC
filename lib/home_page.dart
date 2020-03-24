import 'package:flutter/material.dart';
import 'package:myapp/chatbot.dart';
import 'utils/myColors.dart';
import 'widgets/body.dart';
import './widgets/buttonfloatingdialog.dart';


class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/images/cart.png',
                  fit: BoxFit.contain,
                  height: 32,
                  alignment: Alignment.topLeft,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Smart Assistance',textAlign:TextAlign.center,),alignment:Alignment.center ,),
     
            ],
   
          ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
         
        ],
         flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.indigo,
              Colors.lightBlue
            ])  
      ),
         )
      ),
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [MyColors.white1, MyColors.white2])
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[ Body()],
          ),
        ),
      ),
    ),
    floatingActionButton: new ButtonFloatingDialog(
        child: new Column(children: <Widget>[
          new Container(
            height: 40.0,
            color: Colors.blue,
            child: Center(
            child: new Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                   child:new Text("Shopper Assistance",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,color:Colors.white),) ,
    ),
    Container(
      color: Colors.blue,
      child: IconButton(
              alignment: Alignment.center,
                 icon: Icon(Icons.minimize),color: Colors.white,
              onPressed: () {
               
              },
             ),
             ),
                  ],
              )
        
            ),
          ),
          //new GoogleAssistant(),
          new ChatBot(),
          new Divider(height: 1.0),
 
        ]),
      ),
    );
  }

}
