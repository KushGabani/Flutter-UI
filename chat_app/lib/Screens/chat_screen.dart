import 'package:chat_app/Components/custom_app_bar.dart';
import 'package:chat_app/Models/message.dart';
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

  Widget _messageBuilder(Message message, bool isMe) {
    final Container messageContainer = Container(
      margin: isMe
          ? const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 90.0)
          : const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
      padding: const EdgeInsets.all(12.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            message.time,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.w600, color: Colors.blueGrey),
          ),
        ],
      ),
    );

    if (isMe) {
      return messageContainer;
    }
    return Row(
      children: <Widget>[
        messageContainer,
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: message.isLiked
                    ? Theme.of(context).primaryColor
                    : Colors.black,
                onPressed: () {},
              )
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            CustomAppBar(
              userName: widget.user.name,
              back: () {
                Navigator.pop(context);
              },
              supportIcon: Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(
                        top: 35.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        bool isMe = messages[index].sender.id == currentUser.id;
                        return _messageBuilder(messages[index], isMe);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 25.0,
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: "Send a message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 25.0,
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
