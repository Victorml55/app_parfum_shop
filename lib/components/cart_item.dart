import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_sneaker_shop/models/cart.dart';
import 'package:app_sneaker_shop/models/perfume.dart';

class CartItem extends StatelessWidget {
  final Perfume perfume;
  final int quantity;

  const CartItem({super.key, required this.perfume, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          child: Image.asset(perfume.imagePath, fit: BoxFit.contain),
        ),
        title: Text(
          perfume.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${perfume.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (quantity > 1)
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'x$quantity',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () =>
                  context.read<Cart>().removeItemFromCart(perfume),
            ),
          ],
        ),
      ),
    );
  }
}
