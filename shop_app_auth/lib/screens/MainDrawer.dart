import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/providers/ProductsProvider.dart';
import 'package:shop_app/providers/OrdersProvider.dart';
import 'package:shop_app/screens/CartScreen.dart';
import 'package:shop_app/screens/OrdersScreen.dart';
import 'package:shop_app/screens/ProductFormScreen.dart';
import 'package:shop_app/screens/ProductsOverviewScreen.dart';
import 'package:shop_app/screens/UserProductsScreen.dart';
import 'package:shop_app/widgets/badge.dart';

enum FilterOptions { Favorites, All }

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget selectedScreen = ProductsOverviewScreen();
  bool _isInit = true;
  bool _isLoading = false;

  String getTitle() {
    return selectedScreen is ProductsOverviewScreen
        ? 'Shop'
        : selectedScreen is UserProductsScreen ? 'My Products' : 'Orders';
  }

  void onChangeScreen(Widget screen) {
    setState(() {
      this.selectedScreen = screen;
    });
  }

  @override
  void didChangeDependencies() async {
    if (this._isInit) {
      setState(() {
        this._isLoading = true;
      });
      try {
        // productsProvider.fetchProducts().then((_) {});
        ProductsProvider productsProvider =
            Provider.of<ProductsProvider>(context);
        OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);

        await productsProvider.fetchProducts();
        await ordersProvider.fetchOrders();

        setState(() {
          this._isLoading = false;
        });
      } catch (e) {
        print(e);
        setState(() {
          this._isLoading = false;
        });
      }
    }

    this._isInit = false;

    super.didChangeDependencies();
  }

  Future<void> _refreshData() async {
    if (selectedScreen is ProductsOverviewScreen ||
        selectedScreen is UserProductsScreen) {
      await Provider.of<ProductsProvider>(context, listen: false)
          .fetchProducts();
    }

    if (selectedScreen is OrdersScreen) {
      await Provider.of<OrdersProvider>(context, listen: false).fetchOrders();
    }
  }

  List<Widget> getActions() {
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    return this.selectedScreen is ProductsOverviewScreen
        ? <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions value) {
                if (value == FilterOptions.All) {
                  productsProvider.setOnlyFavorites(false);
                } else {
                  productsProvider.setOnlyFavorites(true);
                }
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
          ]
        : this.selectedScreen is UserProductsScreen
            ? [
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProductFormScreen.routePath);
                  },
                )
              ]
            : [];
  }

  Widget refreshableScreen() {
    return this.selectedScreen is ProductsOverviewScreen
        ? RefreshIndicator(
            child: this.selectedScreen,
            onRefresh: this._refreshData,
          )
        : this.selectedScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.getTitle()),
        actions: this.getActions(),
      ),
      body: this._isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : this.refreshableScreen(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Navigate through the app!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            ListTile(
              leading: Icon(
                Icons.shop,
                color: Theme.of(context).primaryColor,
              ),
              selected: this.selectedScreen is ProductsOverviewScreen,
              onTap: () {
                this.onChangeScreen(ProductsOverviewScreen());
                Navigator.of(context).pop();
              },
              title: Text('Shop'),
            ),
            ListTile(
              leading: Icon(
                Icons.card_travel,
                color: Theme.of(context).primaryColor,
              ),
              selected: this.selectedScreen is OrdersScreen,
              onTap: () {
                this.onChangeScreen(OrdersScreen());

                Navigator.of(context).pop();
              },
              title: Text('Orders'),
            ),
            ListTile(
              leading: Icon(
                Icons.apps,
                color: Theme.of(context).primaryColor,
              ),
              selected: this.selectedScreen is UserProductsScreen,
              onTap: () {
                this.onChangeScreen(UserProductsScreen());
                Navigator.of(context).pop();
              },
              title: Text('My Products'),
            ),
          ],
        ),
      ),
    );
  }
}
