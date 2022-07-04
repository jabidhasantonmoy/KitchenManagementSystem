import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/bazarlist.dart';
import './bazarlist_screen.dart';

enum FilterOptions {
  Favorite,
  All,
  Wishlist,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'সকল বাজার',
          style: TextStyle(color: Colors.red),
        ),
        actions: <Widget>[
          Consumer<Bazarlist>(
            builder: (_, bazarData, ch) => Badge(
              child: ch!,
              value: bazarData.itemCount.toString(),
              color: Colors.pink,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.purpleAccent,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(BazarlistScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Wishlist'),
                value: FilterOptions.Wishlist,
              ),
            ],
          ),
        ],
        backgroundColor: Colors.pink[50],
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.pink[50],
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
