import 'package:chat_app/Models/message.dart';
import 'package:flutter/material.dart';
import './recent_chat.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            return RecentChat(preview: chats[index]);
          },
        ),
      ),
    );
  }
}
