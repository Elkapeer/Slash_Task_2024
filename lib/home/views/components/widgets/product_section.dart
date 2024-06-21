import 'package:flutter/material.dart';
import 'package:slash_task/core/constants.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key,
    required this.title,required this.items, this.givenHeight,});

  final String title;
  final List<Widget> items;
  final double? givenHeight;

  @override
  Widget build(BuildContext context) {
    double itemsHeight = 162.0;
    if(givenHeight != null){
      itemsHeight = givenHeight!;
    }
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(screenPadding,0,screenPadding,screenPadding),
            child: Row(
              children: [
                Text(title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: darkColor
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text("See all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: greyColor,
                          ),
                          child: const Icon(Icons.arrow_forward_ios,size: 16,)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: itemsHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: screenPadding),
                ...items,
              ],
            ),
          )
        ],
      ),
    );
  }
}
