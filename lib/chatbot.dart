import 'package:myapp/widgets/carouselSelect.dart';
import 'package:myapp/widgets/quickReplies.dart';
import './widgets/simple_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import './widgets/card.dart';

  class ChatBot extends StatefulWidget {
  ChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatBot createState() => new _ChatBot();
}

class _ChatBot extends State<ChatBot> {
  final List<dynamic> _messages = <dynamic>[];
  final TextEditingController _textController = new TextEditingController();
  
  BuildContext buildContext;

 void initState (){

   Response("HI");
 }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send,color: Colors.blue,),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  dynamic getWidgetMessage(message) {
    
    TypeMessage ms = TypeMessage(message);
       print(ms.platform);
      print(ms.type);
    
      if (ms.type == "simpleResponses") {
        return SimpleMessage(
          text: message['simpleResponses']['simpleResponses'][0]
              ['textToSpeech'],
          name: "Bot",
          type: false,
        );
      }
      // if (ms.type == "basicCard") {
      //   return BasicCardWidget(card: BasicCardDialogflow(message));
      // }
      // if (ms.type == "carouselSelect") {
      //   return CarouselSelectWidget(
      //       carouselSelect: CarouselSelect(message),
      //       clickItem: (info) {
      //         print(info); // Item Click print List Keys
      //       });
      // }
      if(ms.type == "card") {
       return CardWidget(card: CardDialogflow(message));
        
      }

     
      if(ms.type =="quickReplies")
      {
        return QuickRepliesWidget(quickReplies: QuickReplies(message),clickItem: Response,);
      }

      if (ms.type == "text") {
        return SimpleMessage(
          text: message['text']['text'][0]
              ,
          name: "Bot",
          type: false,
        );
      }
      
      
  }
  
   // return QuickRepliesWidget(quickReplies: QuickReplies(message,messages));
  

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/cr.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    
    AIResponse response = await dialogflow.detectIntent(query);
       
    // setState(() {
    
    //     _messages.insert(0, Progress());
    //   });
    if (response.getMessage() != null && response.getMessage() != "") {
      SimpleMessage message = new SimpleMessage(
        text: response.getMessage(),
        name: "Bot",
        type: false,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  
    else if(response.getpayload()!=null){
    
      dynamic wid = CarouselSelectWidget( carouselSelect:CarouselSelect(response.getpayload()));
           setState(() {
                    _messages.insert(0, wid);
                   // _messages.removeAt(1);
                  });

    }
     else 
     {
       List<dynamic> messages = response.getListMessage();
      if(messages !=null)
      {
        for (var i = 0; i < messages.length; i++) {
                dynamic message = getWidgetMessage(messages[i]);
                if (message != null) {
                    setState(() {
                    _messages.insert(0, message);
                  });
                }
              }
      }
     }
    
      
      
    
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    SimpleMessage message = new SimpleMessage(
      text: text,
      name: "Rances",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    this.buildContext=context;
    
    return new Container(
      height: 500,     
      child: new Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        new Flexible(
          child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}
