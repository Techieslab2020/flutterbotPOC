import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/login_page.dart';
import '../root_page.dart';
import '../widgets/chips.dart';

class Message extends StatelessWidget {
  Message({this.text, this.name, this.type , this.buttonssuggestions});

  final String text;
  final String name;
  final bool type;
  final List<String> buttonssuggestions ;
  
 
  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(child: Text('Bot')),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
              
            ),
            
        Container(
              margin: new EdgeInsets.all(10.0),
              child: Column(
              children: <Widget>[
        SizedBox(
            height: 100.0,
             child: 
               Column(
             children: <Widget>[
                Row(
        
           children:           
           List.generate(buttonssuggestions.length,(index){
            return 
              new 
              Container(
                margin: EdgeInsets.only(right: 7.0),
                
                child :ActionChip(
                 
                  backgroundColor: Colors.white,
                  
                  label: new Text(buttonssuggestions[index],style: TextStyle(color: Colors.blue),),
                   shape: const RoundedRectangleBorder(
                   side: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    
                     ),
                  onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage() ));// update board with selection
             }) );
              })
           
           )
      ],
    ),)
                 
                ],
              )),
            
            ],
        ),
      ),
      
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  <Widget>[
            Text(this.name, style: Theme.of(context).textTheme.subhead),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(child: new Text(this.name[0])),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }


  
  void showColoredToast() {
    Fluttertoast.showToast(
        msg: "This is Colored Toast with android duration of 5 Sec",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}