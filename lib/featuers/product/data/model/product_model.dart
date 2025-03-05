import 'package:caffeine_dashboard/featuers/product/data/model/rating_user_model.dart';

class ProductModel {
  final String productNameEn;
  final String productNameAr;
  final String productDescriptionEn;
  final String productDescriptionAr;
  final String productPrice;
  final String productCode;
  final String productImage;
  final String productCategory;
  final String productInfo;
  final List<String> favIds;
  final double rating;
  final int ratingCount;
  final List<RatingUserModel> ratingUserModel;

  ProductModel({
    required this.productNameEn,
    required this.productNameAr,
    required this.productDescriptionEn,
    required this.productDescriptionAr,
    required this.productPrice,
    required this.productCode,
    required this.productImage,
    required this.productCategory,
    required this.productInfo,
    required this.favIds,
    required this.rating,
    required this.ratingCount,
    required this.ratingUserModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productNameEn: json['productNameEn'] as String,
    productNameAr: json['productNameAr'] as String,
    productDescriptionEn: json['productDescriptionEn'] as String,
    productDescriptionAr: json['productDescriptionAr'] as String,
    productPrice: json['productPrice'] as String,
    productCode: json['productCode'] as String,
    productImage: json['productImage'] as String,
    productCategory: json['productCategory'] as String,
    productInfo: json['productInfo'] as String,
    favIds: json['favIds'] as List<String>,
    rating: json['rating'] as double,
    ratingCount: json['ratingCount'] as int,
    ratingUserModel: List<RatingUserModel>.from(
      json['ratingsUserModel'].map((x) => RatingUserModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'productNameEn': productNameEn,
    'productNameAr': productNameAr,
    'productDescriptionEn': productDescriptionEn,
    'productDescriptionAr': productDescriptionAr,
    'productPrice': productPrice,
    'productCode': productCode,
    'productImage': productImage,
    'productCategory': productCategory,
    'productInfo': productInfo,
    'favIds': favIds,
    'rating': rating,
    'ratingCount': ratingCount,
    'ratingsUserModel': ratingUserModel.map((x) => x.toJson()).toList(),
  };
}
