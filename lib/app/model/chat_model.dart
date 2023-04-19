class ChatModel {
  String name;
  String messageText;
  String? imageURL;
  ChatModel({
    required this.name,
    required this.messageText,
    this.imageURL,
  });
}

List<ChatModel> chatList = [
  ChatModel(
    name: 'PastaRey Artisinal Foods',
    messageText: 'Hi',
  ),
  ChatModel(
    name: 'Fuzetea',
    messageText: 'I want this product in lemon flav......',
    imageURL: 'https://randomuser.me/api/portraits/men/67.jpg',
  ),
  ChatModel(
    name: 'Craftizen',
    messageText: 'Hi',
    imageURL: 'https://randomuser.me/api/portraits/men/39.jpg',
  ),
];

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(
    messageContent: 'Is there any thing wrong?',
    messageType: 'sender',
  ),
  ChatMessage(
    messageContent: 'Hey Kriss, I am doing fine dude. wbu?',
    messageType: 'sender',
  ),
  ChatMessage(
    messageContent: 'ehhhh, doing OK.',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'How have you been?',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'Hello, Will',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'Is there any thing wrong?',
    messageType: 'sender',
  ),
  ChatMessage(
    messageContent: 'Hey Kriss, I am doing fine dude. wbu?',
    messageType: 'sender',
  ),
  ChatMessage(
    messageContent: 'ehhhh, doing OK.',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'How have you been?',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'Hello, Will',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'ehhhh, doing OK.',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'How have you been?',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'Hello, Will',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'Is there any thing wrong?',
    messageType: 'sender',
  ),
  ChatMessage(
    messageContent: 'Hey Kriss, I am doing fine dude. wbu?',
    messageType: 'sender',
  ),
  ChatMessage(
    messageContent: 'ehhhh, doing OK.',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'How have you been?',
    messageType: 'receiver',
  ),
  ChatMessage(
    messageContent: 'Hello, Will',
    messageType: 'receiver',
  ),
];
