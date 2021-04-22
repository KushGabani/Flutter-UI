import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 30.0),
      decoration: BoxDecoration(
        color: Color(0xFFA0A5BD),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: Color(0xDD616888),
        ),
        decoration: InputDecoration(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Search for anything",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
