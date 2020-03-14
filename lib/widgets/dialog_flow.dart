import 'package:flutter/material.dart';

import 'fact_message.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import '../BotSuggestion.dart';

class FlutterDialogFlow extends StatefulWidget {
  
  FlutterDialogFlow({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FlutterDialogFlowState createState() => new _FlutterDialogFlowState();
 
}

class _FlutterDialogFlowState extends State<FlutterDialogFlow> {
  
   @override
  void initState() {
    super.initState();
       _dialogFlowResponse("HI");
     }
  final List<Message> _messages = <Message>[];
  final TextEditingController _textController = new TextEditingController();
        bool _validate = false;
  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
         child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                autocorrect: true,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if(_textController.text.toString()!="")
                    {
                     _submitQuery(_textController.text);
                    }else{
                      
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson:"assets/credentials.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
     var botSuggestions = BotSuggestions(response.getListMessage());
     print(botSuggestions.suggestions);
     
    Message message = Message(
      text: response.getMessage() ?? 
           CardDialogflow(response.getListMessage()[0]).title,
           
      name: "Virtual Agent",
      type: false,
      buttonssuggestions:botSuggestions.suggestions,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
 
  void _submitQuery(String text) {
    _textController.clear();
    Message message = new Message(
      text: text,
      name: "Hemendra",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _dialogFlowResponse(text);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: Text("Shopper Assistent"),
  //     ),
  //     body: Column(children: <Widget>[
  //       Flexible(
  //             child: ListView.builder(
  //             padding: EdgeInsets.all(8.0),
  //             reverse: true, //To keep the latest messages at the bottom
  //             itemBuilder: (_, int index) => _messages[index],
  //             itemCount: _messages.length,
  //           )),
  //       Divider(height: 1.0),
  //       Container(
  //         decoration: new BoxDecoration(color: Theme.of(context).cardColor),
  //         child: _queryInputWidget(context),
  //       ),
  //     ]),
  //   );
  // }




 @override
  Widget build(BuildContext context) {
    return Container(
    child:Container(
      height: 500,
      child:
      Column(children: <Widget>[
        Flexible(
              child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _queryInputWidget(context),
        ),
      ]),
    ));
  }
  
}
