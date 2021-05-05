import 'package:flutter/material.dart';
import './../Components/custom_app_bar.dart';
import './../Components/category_selector.dart';
import './../Components/favorite_contacts.dart';
import './../Components/chat_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            CustomAppBar(),
            CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    FavoriteContacts(),
                    ChatList()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}