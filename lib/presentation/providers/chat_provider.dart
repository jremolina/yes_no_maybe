import 'package:flutter/material.dart';
import 'package:yes_no_maybe/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_maybe/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollcontroller = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola !!', fromWho: FromWho.me),
    Message(text: 'ya regresaste..??', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final hermessage = await GetYesNoAnswer().getAnswer();
    messageList.add(hermessage);
    notifyListeners();

     moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollcontroller.animateTo(
        chatScrollcontroller.position.maxScrollExtent,
        //offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
