import 'package:flutter/material.dart';
import 'package:slash_task/core/constants.dart';

/// [Category] widget that consists of a [icon] button and text which shows it's [type]
class Category extends StatelessWidget {
  const Category({super.key, required this.image, required this.type});
  final String image;
  final String type;
  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size.height / 8 - 20;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: (){},
            child: Container(
              height: dimension,
              width: dimension,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: darkColor
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage(
                    image,
                  ),
                  color: Colors.white,
                  size: dimension / 2,
                ),
              ),
            ),
          ),
        ),
        Text(
          type,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: regularWeight,
            color: darkColor
          ),
        )
      ],
    );
  }
}
