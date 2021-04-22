import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BestSellerClipper(),
      child: Container(
        padding: const EdgeInsets.only(
            left: 8.0, top: 3.0, bottom: 3.0, right: 20.0),
        color: kBestSellerColor,
        child: Text(
          "Bestseller".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
