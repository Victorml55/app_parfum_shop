import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_sneaker_shop/models/cart.dart';
import 'package:app_sneaker_shop/components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final groupedCart = context.watch<Cart>().getGroupedCart();
    final entries = groupedCart.entries.toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
            child: Text(
              'My Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // lista de productos
          Expanded(
            child: entries.isEmpty
                ? Center(
                    child: Text(
                      'Tu carrito está vacío',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (context, index) => CartItem(
                      perfume: entries[index].key,
                      quantity: entries[index].value,
                    ),
                  ),
          ),

          // boton pay now
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
