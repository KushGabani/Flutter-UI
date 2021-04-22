import 'package:course_app/Screens/components/course_tile.dart';
import 'package:course_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CourseGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StaggeredGridView.countBuilder(
      padding: const EdgeInsets.only(top: 20.0),
      crossAxisCount: 2,
      crossAxisSpacing: 25.0,
      mainAxisSpacing: 25.0,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CourseTile(index: index);
      },
      staggeredTileBuilder: (index) {
        return StaggeredTile.fit(1);
      },
    ));
  }
}
