import 'package:flutter/material.dart';
import '../../../../core/models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.cart});
  final List<Product> cart;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Cart"
      ),
    );
  }
}
