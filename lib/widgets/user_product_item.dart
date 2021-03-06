import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  //const ({Key? key}) : super(key: key);

  UserProductItem(
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
              color: Colors.pink,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
