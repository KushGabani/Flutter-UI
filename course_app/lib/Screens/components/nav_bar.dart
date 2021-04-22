import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  final String avatar;

  NavBar({
    Key key,
    @required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.asset("assets/icons/menu.svg"),
        Image.asset(this.avatar),
      ],
    );
  }
}
