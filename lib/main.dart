import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_details_screen.dart';
import './providers/products_data_providers.dart';
import './providers/bazarlist.dart';
import './screens/bazarlist_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Bazarlist(),
        ),
      ],
      child: MaterialApp(
        title: 'Capstone',
        theme: ThemeData(
          backgroundColor: Colors.pink[50],
          // primarySwatch: Colors.pink,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          BazarlistScreen.routName: (ctx) => BazarlistScreen(),
        },
      ),
    );
  }
}
