import 'package:caffeine_dashboard/featuers/product/data/model/rating_user_model.dart';

class ProductModel {
  final String productNameEn;
  final String productNameAr;
  final String productDescriptionEn;
  final String productDescriptionAr;
  final String productPriceS;
  final String productPriceM;
  final String productPriceL;
  final String productCode;
  final String productImage;
  final String productCategory;
  final String productInfo;
  final List<String> favIds;
  final dynamic rating;
  final int ratingCount;
  final List<RatingUserModel> ratingUserModel;

  ProductModel({
    required this.productNameEn,
    required this.productNameAr,
    required this.productDescriptionEn,
    required this.productDescriptionAr,
    required this.productPriceS,
    required this.productPriceM,
    required this.productPriceL,
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
    productPriceS: json['productPriceS'] as String,
    productPriceM: json['productPriceM'] as String,
    productPriceL: json['productPriceL'] as String,
    productCode: json['productCode'] as String,
    productImage: json['productImage'] as String,
    productCategory: json['productCategory'] as String,
    productInfo: json['productInfo'] as String,
    favIds: List<String>.from(json['favIds']),
    rating: json['rating'] as dynamic,
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
    'productPriceS': productPriceS,
    'productPriceM': productPriceM,
    'productPriceL': productPriceL,
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
