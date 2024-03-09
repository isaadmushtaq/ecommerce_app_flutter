import 'package:ecomerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
      imagePath: 'lib/images/salmon-sushi.png',
      name: 'Salmon Sushi',
      price: '21.99',
      description:
          'Salmon sushi is a type of Japanese cuisine that consists of raw salmon slices served on top of vinegared rice. It is one of the most popular varieties of sushi in Japan and abroad, as salmon is rich in omega-3 fatty acids and has a mild flavor that complements the rice. Salmon sushi can be eaten with soy sauce, wasabi and ginger, or with other toppings and sauces depending on personal preference.',
    ),
    Product(
        imagePath: 'lib/images/tuna.png',
        name: 'Tuna',
        price: '23.99',
        description:
            'Tuna is a type of saltwater fish that belongs to the Scombridae family. There are many species of tuna, such as albacore, bluefin, yellowfin, and skipjack. Tuna are highly migratory and can swim long distances across the oceans. They are also among the fastest and largest fish in the world. Tuna are prized for their meat, which is rich in protein and omega-3 fatty acids. Tuna are caught by various methods, such as fishing rods, nets, and longlines. Some tuna species are endangered due to overfishing and habitat loss.'),
  ];

  //list for cart

  final List _cart = [];

  //get prods
  List get shop => _shop;

  //get cart
  List get cart => _cart;

  //add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item from the cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
