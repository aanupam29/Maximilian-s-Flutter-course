import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/providers/OrdersProvider.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/screens/ProductDetailScreen.dart';
import 'package:shop_app/screens/ProductsOverviewScreen.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext _) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext _) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext _) => OrdersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
            primaryColor: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routePath: (BuildContext _) =>
              ProductDetailScreen(),
          CartScreen.routePath: (BuildContext _) => CartScreen()
        },
      ),
    );
  }
}
