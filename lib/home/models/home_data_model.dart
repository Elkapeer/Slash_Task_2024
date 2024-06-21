import 'package:slash_task/core/models/product_model.dart';

class HomeDataModel {
  List<Product>? bestSelling;
  List<Product>? newArrival;
  List<Product>? recommendedForYou;

  HomeDataModel({this.bestSelling, this.newArrival, this.recommendedForYou});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['bestSelling'] != null) {
      bestSelling = <Product>[];
      json['bestSelling'].forEach((v) {
        bestSelling!.add(Product.fromJson(v));
      });
    }
    if (json['newArrival'] != null) {
      newArrival = <Product>[];
      json['newArrival'].forEach((v) {
        newArrival!.add(Product.fromJson(v));
      });
    }
    if (json['recommendedForYou'] != null) {
      recommendedForYou = <Product>[];
      json['recommendedForYou'].forEach((v) {
        recommendedForYou!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (bestSelling != null) {
      data['bestSelling'] = bestSelling!.map((v) => v.toJson()).toList();
    }
    if (newArrival != null) {
      data['newArrival'] = newArrival!.map((v) => v.toJson()).toList();
    }
    if (recommendedForYou != null) {
      data['recommendedForYou'] =
          recommendedForYou!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



