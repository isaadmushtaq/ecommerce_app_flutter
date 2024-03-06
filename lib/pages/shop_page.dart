import 'package:ecomerce_app/components/my_drawer.dart';
import 'package:ecomerce_app/components/my_product_tile.dart';
import 'package:ecomerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access the product in the shop
    final products = context.watch<Shop>().shop;
    final cart = context.watch<Shop>().cart;
    final String cartItemsCount = cart.length.toString();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Shop Page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: <Widget>[
            badges.Badge(
              badgeContent: Text(
                cartItemsCount,
                style: TextStyle(color: Colors.white),
              ),
              showBadge: true,
              ignorePointer: false,
              position: badges.BadgePosition.topEnd(top: 0, end: 6),
              badgeAnimation: const badges.BadgeAnimation.size(
                  animationDuration: Duration(milliseconds: 500)),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.grey,
              ),
              
              child: IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 25,
                  )),
            ),
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 450,
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //get each individual prod from the shop
                    final product = products[index];

                    //return as the product UI
                    return ProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
