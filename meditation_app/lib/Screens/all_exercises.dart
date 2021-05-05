import 'package:demo_app/Components/category_card.dart';
import 'package:demo_app/Components/search_bar.dart';
import 'package:demo_app/Model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllExercises extends StatelessWidget {
  const AllExercises({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * 0.40,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 52,
                  width: 52,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF2BEA1),
                  ),
                  child: SvgPicture.asset("assets/icons/menu.svg"),
                ),
              ),
              Text(
                "Good Morning\nKush",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              SearchBar(),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: List.generate(
                    categoriesData.length,
                        (index) {
                      return CategoryCard(
                        imagePath: categoriesData[index].imagePath,
                        categoryTitle: categoriesData[index].categoryName,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return categoriesData[index].screen;
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}