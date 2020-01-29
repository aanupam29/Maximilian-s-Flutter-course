import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/AuthProvider.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/providers/OrdersProvider.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/screens/AuthScreen.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/screens/MainDrawer.dart';
import 'package:shop_app/screens/ProductDetailScreen.dart';
import 'package:shop_app/screens/ProductFormScreen.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext _) => AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ProductsProvider>(
          update: (BuildContext _, AuthProvider authProvider,
                  ProductsProvider productsProvider) =>
              ProductsProvider(
            authToken: authProvider.token,
            userId: authProvider.userId,
            providerProducts: productsProvider.allProducts,
            providerUserProducts: productsProvider.userProducts,
          ),
          create: (BuildContext _) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext _) => CartProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, OrdersProvider>(
          update: (BuildContext _, AuthProvider authProvider,
                  OrdersProvider ordersProvider) =>
              OrdersProvider(
            token: authProvider.token,
            providerOrders: ordersProvider.orders,
          ),
          create: (BuildContext _) => OrdersProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (BuildContext context, AuthProvider provider, Widget _) {
          return MaterialApp(
            title: 'Shop App',
            theme: ThemeData(
              primaryColor: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: provider.isAuthenticated ? MainDrawer() : AuthScreen(),
            routes: {
              ProductDetailScreen.routePath: (BuildContext _) =>
                  ProductDetailScreen(),
              CartScreen.routePath: (BuildContext _) => CartScreen(),
              ProductFormScreen.routePath: (BuildContext _) =>
                  ProductFormScreen(),
            },
          );
        },
      ),
    );
  }
}
