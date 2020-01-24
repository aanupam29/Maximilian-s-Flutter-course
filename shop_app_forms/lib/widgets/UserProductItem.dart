import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem({this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(this.imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
