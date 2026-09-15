import 'package:flutter/material.dart';
import 'package:app_sneaker_shop/models/perfume.dart';

class Cart extends ChangeNotifier {
  final List<Perfume> shopPerfumes = [
    Perfume(
      name: 'Sauvage',
      brand: 'Dior',
      imagePath: 'lib/images/DiorSauvage.png',
      description: 'Fresco, amaderado y especiado. Un clásico moderno',
      price: 89.99,
    ),
    Perfume(
      name: 'Le Beau',
      brand: 'Jean Paul Gaultier',
      imagePath: 'lib/images/JPGLeBeau.png',
      description: 'Cálido y sensual, con notas de coco y madera de cedro',
      price: 74.99,
    ),
    Perfume(
      name: 'Le Male Elixir',
      brand: 'Jean Paul Gaultier',
      imagePath: 'lib/images/JPGLeMaleElixir.png',
      description: 'Intenso y envolvente, la versión concentrada del icónico Le Male',
      price: 92.50,
    ),
    Perfume(
      name: 'Le Male Le Parfum',
      brand: 'Jean Paul Gaultier',
      imagePath: 'lib/images/JPGLeMaleLP.png',
      description: 'Elegante y adictivo, con vainilla y lavanda',
      price: 88.00,
    ),
    Perfume(
      name: 'Scandal',
      brand: 'Jean Paul Gaultier',
      imagePath: 'lib/images/JPGScandal.png',
      description: 'Audaz y magnético, miel y flor de azahar',
      price: 79.99,
    ),
  ];

  final List<Perfume> userCart = [];

  List<Perfume> getShopPerfumes() => shopPerfumes;

  List<Perfume> getUserCart() => userCart;

  // agrupa el carrito por perfume, contando cuántas unidades hay de cada uno
  Map<Perfume, int> getGroupedCart() {
    final grouped = <Perfume, int>{};
    for (final perfume in userCart) {
      grouped[perfume] = (grouped[perfume] ?? 0) + 1;
    }
    return grouped;
  }

  void addItemToCart(Perfume perfume) {
    userCart.add(perfume);
    notifyListeners();
  }

  // elimina todas las unidades de ese perfume (la línea completa del carrito)
  void removeItemFromCart(Perfume perfume) {
    userCart.removeWhere((p) => p == perfume);
    notifyListeners();
  }
}
