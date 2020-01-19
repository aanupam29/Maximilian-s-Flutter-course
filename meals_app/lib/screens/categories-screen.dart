import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category-item.dart';
import '../data/dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        child: GridView(
          padding: const EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(
                    color: category.color,
                    title: category.title,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.6,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
