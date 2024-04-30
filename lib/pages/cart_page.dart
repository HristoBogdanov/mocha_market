import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mocha_market/components/coffee_tile.dart';
import 'package:mocha_market/models/coffee.dart';
import 'package:mocha_market/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context as BuildContext, listen: false)
        .removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //heading
                    const Text(
                      "Your cart",
                      style: TextStyle(fontSize: 20),
                    ),

                    Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            Coffee eachCoffee = value.userCart[index];

                            return CoffeeTile(
                                coffee: eachCoffee,
                                onPressed: () => removeFromCart(eachCoffee),
                                icon: const Icon(Icons.delete));
                          }),
                    )
                  ],
                ),
              ),
            ));
  }
}
