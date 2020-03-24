class BotSuggestions {
  List<String> suggestions = [];

  BotSuggestions(List<dynamic> messages) {
    messages.forEach((message) {
      if (message['webhookPayload'] != null) {
        List<dynamic> suggestionList = message['webhookPayload']['CarouselSelect'];
        suggestionList.forEach((suggestion) => suggestions.add(suggestion));
      }
    });
  }
}