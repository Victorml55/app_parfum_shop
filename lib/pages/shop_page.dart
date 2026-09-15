import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_sneaker_shop/models/cart.dart';
import 'package:app_sneaker_shop/components/perfume_tile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final perfumes = context.watch<Cart>().getShopPerfumes();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),

          // barra de busqueda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[700]),
                  const SizedBox(width: 10),
                  Text('Search', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          // mensaje promocional
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Encuentra la fragancia perfecta para cada ocasión',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          const SizedBox(height: 25),

          // encabezado hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('See all', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // carrusel de perfumes
          SizedBox(
            height: 340,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: perfumes.length,
              itemBuilder: (context, index) => PerfumeTile(perfume: perfumes[index]),
            ),
          ),
        ],
      ),
    );
  }
}
