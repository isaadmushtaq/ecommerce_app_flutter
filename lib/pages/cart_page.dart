import 'package:ecomerce_app/models/product.dart';
import 'package:ecomerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove icon from cart
  void removeIconFrom(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Remove this item from cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? const Center(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.grey,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'is Empty!',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual item
                        final item = cart[index];

                        //return list UI
                        return Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 20, right: 20),
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Image.asset(item.imagePath),
                            title: Text(item.name),
                            subtitle: Text('\$ ${item.price}'),
                            trailing: IconButton(
                                onPressed: () {
                                  removeIconFrom(context, item);
                                },
                                icon: const Icon(Icons.minimize)),
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
