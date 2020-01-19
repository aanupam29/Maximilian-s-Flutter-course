import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(this.title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            this.color.withOpacity(0.7),
            this.color.withOpacity(0.2),
            this.color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
