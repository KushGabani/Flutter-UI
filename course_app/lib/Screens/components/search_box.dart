import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              hintText: "Search for anything",
              hintStyle: TextStyle(color: Color(0xFFA2A2A2)),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
