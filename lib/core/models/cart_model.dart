class CartModel {
  final String productNameAr;
  final String productNameEn;
  final String productImage;
  final String productCode;
  final String orderProductCode;
  final String productCategory;
  final String productPriceS;
  final String productPriceM;
  final String productPriceL;
  int quantity;
  String sizeEn;
  String sizeAr;

  CartModel({
    required this.productNameAr,
    required this.productNameEn,
    required this.productImage,
    required this.productCode,
    required this.orderProductCode,
    required this.productCategory,
    required this.productPriceS,
    required this.productPriceM,
    required this.productPriceL,
    required this.quantity,
    required this.sizeEn,
    required this.sizeAr,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productNameAr: json['productNameAr'],
      productNameEn: json['productNameEn'],
      productImage: json['productImage'],
      productCode: json['productCode'],
      orderProductCode: json['orderProductCode'],
      productCategory: json['productCategory'],
      productPriceS: json['productPriceS'],
      productPriceM: json['productPriceM'],
      productPriceL: json['productPriceL'],
      quantity: json['quantity'],
      sizeEn: json['sizeEn'],
      sizeAr: json['sizeAr'],
    );
  }

  toJson() => <String, dynamic>{
    'productNameAr': productNameAr,
    'productNameEn': productNameEn,
    'productImage': productImage,
    'productCode': productCode,
    'orderProductCode': orderProductCode,
    'productCategory': productCategory,
    'productPriceS': productPriceS,
    'productPriceM': productPriceM,
    'productPriceL': productPriceL,
    'quantity': quantity,
    'sizeEn': sizeEn,
    'sizeAr': sizeAr,
  };
}
