import 'package:flutter/material.dart';
import './../Models/user.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _ChatScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
        ),
    );
  }
}
