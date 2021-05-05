import 'package:flutter/material.dart';

import '../constants.dart';

class SessionCard extends StatelessWidget {
  final int sessionId;
  final bool isDone;
  final Function press;
  final Color colorTheme;

  const SessionCard({
    Key key,
    this.sessionId,
    this.isDone = false,
    this.press,
    this.colorTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: kShadowColor,
                )
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: this.press,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: this.isDone ? this.colorTheme : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: this.colorTheme,)
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: this.isDone ? Colors.white : this.colorTheme,
                      ),
                    ),
                    Text(
                      'Session $sessionId',
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
