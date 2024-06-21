import 'package:flutter/material.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/home/models/home_data_model.dart';
import 'package:slash_task/home/views/components/widgets/category.dart';
import 'package:slash_task/home/views/components/widgets/offers.dart';
import 'package:slash_task/home/views/components/widgets/product_card.dart';
import 'package:slash_task/home/views/components/widgets/product_section.dart';

import '../../../../core/globals.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.homeDataModel});

  final ScrollController controller = ScrollController();
  final HomeDataModel homeDataModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(  // To change UI according to different screen sizes
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              constraints.maxWidth < 600?  //phone
              Offers(
                width: MediaQuery.of(context).size.width - 2 * screenPadding,
                height: MediaQuery.of(context).size.height / 5.5,
                isPhone: true,
              ) :
              //tablet or desktop
              Offers(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 4,
                isPhone: false,
              ),
              Column(
                children: [
                  // Categories
                  ProductSection(
                    title: "Categories",
                    items: categories.map((e) => Category(
                      image: e["image"],
                      type: e["type"],
                    )).toList(),
                    givenHeight: MediaQuery.of(context).size.height / 6,
                  ),
                  // Best Selling
                  ProductSection(
                    title: "Best Selling",
                    items: homeDataModel.bestSelling!.map((e) =>
                      ProductCard(
                        id: e.id,
                        name: e.name,
                        image: e.image,
                        price: e.price,
                        isFavorite: false,
                        isAdded: false,
                      )
                    ).toList(),
                  ),
                  const SizedBox(height: 30,),
                  // New Arrival
                  ProductSection(
                      title: "New Arrival",
                      items: homeDataModel.newArrival!.map((e) =>
                          ProductCard(
                            id: e.id,
                            name: e.name,
                            image: e.image,
                            price: e.price,
                            isFavorite: false,
                            isAdded: false,
                          )
                      ).toList(),
                  ),
                  const SizedBox(height: 30,),
                  // Recommended For You
                  ProductSection(
                      title: "Recommended for you",
                      items: homeDataModel.recommendedForYou!.map((e) =>
                          ProductCard(
                            id: e.id,
                            name: e.name,
                            image: e.image,
                            price: e.price,
                            isFavorite: false,
                            isAdded: false,
                          )
                      ).toList(),
                  ),
                  const SizedBox(height: 30,)
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
