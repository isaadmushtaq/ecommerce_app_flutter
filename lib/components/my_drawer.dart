import 'package:ecomerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(
                height: 25,
              ),
              MyListTile(
                  icon: Icons.home,
                  text: 'Shop',
                  onTap: () => Navigator.of(context).pop()),
              MyListTile(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/cart_page');
                  }),
              MyListTile(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              MyListTile(
                  icon: Icons.info,
                  text: 'About',
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              icon: Icons.logout,
              text: 'Exit',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
