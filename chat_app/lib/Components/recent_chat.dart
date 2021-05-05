import 'package:flutter/material.dart';
import './../Models/message.dart';
import './../Screens/chat_screen.dart';

class RecentChat extends StatelessWidget {
  final Message preview;

  RecentChat({
    Key key,
    this.preview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatScreen(user: preview.sender);
        },),);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Stack(
          children: [
            preview.unread ? Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 12.0,
                width: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ) : SizedBox(),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: preview.unread
                      ? Theme.of(context).primaryColor.withOpacity(0.05)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  )),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage(preview.sender.imageUrl),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          preview.sender.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          preview.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.normal, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    preview.time,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
