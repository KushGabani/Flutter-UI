import 'dart:math';
import 'package:flutter/material.dart';
import 'package:demo_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './../Components/search_bar.dart';
import './../Components/session_card.dart';
import './../Components/bottom_nav_bar.dart';

class Meditation extends StatelessWidget {
  const Meditation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(pageIndex: 1,),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                  color: kBlueLightColor,
                  image: DecorationImage(
                    image: AssetImage("assets/images/meditation_bg.png"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "3 - 10 MIN COURSE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                          "Live happier and healthier by learning the fundamentals of meditation and mindfulness"),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: List.generate(
                        6,
                        (index) {
                          Random gen = new Random();
                          return SessionCard(
                            sessionId: index,
                            isDone: gen.nextBool(),
                            colorTheme: kBlueLightColor,
                            press: () {},
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Meditation",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SvgPicture.asset(
                                    "assets/icons/Meditation_women_small.svg"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Basics 2",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("Start to deepen your practice")
                                  ],
                                ),
                                SvgPicture.asset("assets/icons/Lock.svg")
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
