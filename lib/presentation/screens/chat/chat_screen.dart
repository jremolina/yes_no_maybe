import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe/domain/entities/message.dart';
import 'package:yes_no_maybe/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe/presentation/widgets/chat/her_message.dart';
import 'package:yes_no_maybe/presentation/widgets/chat/my_message.dart';
import 'package:yes_no_maybe/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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'),
          ),
        ),
        title: const Text("Chat"),
        //centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollcontroller,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                // return (index % 2 == 0
                //     ? const HerMessageBubble()
                //     : const MyMessageBubble());
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(
              onValue: (String value) {
                chatProvider.sendMessage(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
