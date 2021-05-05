import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function back;
  final String userName;
  final Icon supportIcon;

  const CustomAppBar({
    Key key,
    this.back,
    this.userName = "",
    this.supportIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 8.0, right: 15.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.white,
            ),
            onPressed: this.back,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              this.userName,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: this.supportIcon,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
