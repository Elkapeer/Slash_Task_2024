import 'package:flutter/material.dart';
import 'package:slash_task/home/views/components/widgets/product_card.dart';
import '../../../../core/models/product_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favorites});
  final List<Product> favorites;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favorites"),
    );
  }
}
