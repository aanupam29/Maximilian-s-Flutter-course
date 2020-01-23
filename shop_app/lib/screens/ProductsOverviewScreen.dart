import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/widgets/ProductsList.dart';
import 'package:shop_app/widgets/badge.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool onlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.All) {
                  onlyFavorites = false;
                } else {
                  onlyFavorites = true;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (BuildContext _) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (BuildContext _, CartProvider provider, child) => Badge(
              child: child,
              value: provider.cartCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routePath);
              },
            ),
          )
        ],
      ),
      body: ProductsList(this.onlyFavorites),
    );
  }
}
