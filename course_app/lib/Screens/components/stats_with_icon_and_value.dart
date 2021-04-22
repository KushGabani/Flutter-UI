import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatsWithIconAndValue extends StatelessWidget {
  final String iconPlaceholder;
  final String value;

  StatsWithIconAndValue({
    Key key,
    @required this.iconPlaceholder,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        children: [
          SvgPicture.asset(this.iconPlaceholder),
          SizedBox(width: 5.0),
          Text(
            this.value,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
