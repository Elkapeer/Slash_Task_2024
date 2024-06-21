import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/core/models/product_model.dart';
import 'package:slash_task/home/blocs/home_bloc.dart';

///Represents a product that has an [image], [price] and [name]
class ProductCard extends StatelessWidget {
  ProductCard({super.key, this.id, this.image, this.price, this.name,
    required this.isFavorite, required this.isAdded});
  final int? id;
  final String? name;
  final String? image;
  final double? price;
  bool isFavorite;
  bool isAdded;

  @override
  Widget build(BuildContext context) {
    const descSize = 46;
    const imageHeight = 162.0 - descSize;
    const width = 124.0;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                Container(
                  height: imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                const SizedBox(height: 5,),
                // Product name
                Text(
                  name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkColor,
                    fontSize: 16,
                    fontWeight: regularWeight
                  ),
                ),
                Row(
                  children: [
                    // Product price
                    Text(
                      "EGP $price",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: boldWeight,
                        color: darkColor
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        // Product owner
                        InkWell(
                          child: Container(
                            width: 21,
                            height: 21,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(image!),
                                fit: BoxFit.fill
                              )
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        // Add to cart
                        InkWell(
                          onTap: (){
                            if(isAdded){
                              BlocProvider.of<HomeBloc>(context).add(
                                  RemoveCart(
                                      Product(
                                        id: id,
                                        image: image,
                                        name: name,
                                        price: price,
                                      )
                                  )
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Removed from Cart!"))
                              );
                            }
                            else{
                              BlocProvider.of<HomeBloc>(context).add(
                                  AddToCart(
                                      Product(
                                        id: id,
                                        image: image,
                                        name: name,
                                        price: price,
                                      )
                                  )
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Added to Cart!"))
                              );
                            }
                            isAdded = !isAdded;
                          },
                          child: Container(
                            width: 21,
                            height: 21,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: darkColor,
                            ),
                            child: Icon(
                              isAdded? Icons.remove : Icons.add,
                              color: Colors.white,size: 15,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // Add to favorites
          Positioned(
            top: 6,
            right: 6,
            child: InkWell(
              onTap: (){
                if(isFavorite){
                  BlocProvider.of<HomeBloc>(context).add(
                      RemoveFavorite(
                          Product(
                            id: id,
                            image: image,
                            name: name,
                            price: price,
                          )
                      )
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Removed from Favorites!"))
                  );
                }else{
                  BlocProvider.of<HomeBloc>(context).add(
                      AddToFavorite(
                          Product(
                            id: id,
                            image: image,
                            name: name,
                            price: price,
                          )
                      )
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to Favorites!"))
                  );
                }
                isFavorite = !isFavorite;
              },
              child: Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: greyColor,
                  ),
                  child: Icon(
                    isFavorite? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: isFavorite? Colors.red : darkColor,
                    size: 16,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
