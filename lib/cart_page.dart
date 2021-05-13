import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartBloc bloc = Provider.of<CartBloc>(context);
    Map<int, int> cart = bloc.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex];

          return ListTile(
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/${giftIndex + 1}.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            title: Text('Item Count: $count'),
            trailing: ElevatedButton(
              onPressed: () {
                bloc.clear(giftIndex);
              },
              child: Text('Clear'),
            ),
          );
        },
      ),
    );
  }
}
