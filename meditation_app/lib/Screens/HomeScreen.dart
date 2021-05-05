import 'package:flutter/material.dart';
import './../Components/bottom_nav_bar.dart';
import 'all_exercises.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 1;

  static const List<Widget> _screens = <Widget>[
    Center(
      child: Text("Other Page"),
    ),
    AllExercises(),
    Center(
      child: Text("Other Page"),
    ),
  ];

  void changePage(newIndex) {
    setState(() {
      _pageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(
          pageIndex: _pageIndex,
          changePage: changePage,
        ),
        body: _screens.elementAt(_pageIndex),
      ),
    );
  }
}
