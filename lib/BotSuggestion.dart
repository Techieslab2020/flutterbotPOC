class BotSuggestions {
  List<String> suggestions = [];

  BotSuggestions(List<dynamic> messages) {
    messages.forEach((message) {
      if (message['payload'] != null) {
        List<dynamic> suggestionList = message['payload']['welcomesuggestions'];
        suggestionList.forEach((suggestion) => suggestions.add(suggestion));
      }
    });
  }
}