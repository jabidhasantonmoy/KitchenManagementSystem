import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_details_screen.dart';
import '../providers/product.dart';
import '../providers/bazarlist.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final bazar = Provider.of<Bazarlist>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Container(
        color: Colors.pink[100],
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              cacheHeight: 100,
              cacheWidth: 90,
              // fit: BoxFit.cover,
            ),
          ),
          footer: SizedBox(
            height: 35,
            child: GridTileBar(
              backgroundColor: Colors.pink[100],
              leading: Consumer<Product>(
                builder: (ctx, product, _) => IconButton(
                  icon: Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Colors.pink,
                  // color: Theme.of(context).accentColor,
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  },
                ),
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  bazar.addItem(product.id, product.price, product.title);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added item to list'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          bazar.removeSingleItem(product.id);
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_bag_outlined),
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
