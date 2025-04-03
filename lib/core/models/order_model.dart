import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:caffeine_dashboard/core/models/cart_model.dart';

class OrderModel {
  final dynamic date;
  final String orderId;
  final String paymentMethod;
  final String orderedBy;
  final String statusOfOrder;
  final int stepperValue;
  final String note;
  final String userId;
  final List<CartModel> products;
  final int totalPrice;
  final BranchModel? branchModel;

  OrderModel({
    required this.date,
    required this.totalPrice,
    required this.orderId,
    this.branchModel,
    required this.paymentMethod,
    required this.orderedBy,
    required this.statusOfOrder,
    required this.stepperValue,
    required this.note,
    required this.userId,
    required this.products,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      date: map['date'],
      orderId: map['orderId'] as String,
      paymentMethod: map['paymentMethod'] as String,
      orderedBy: map['orderedBy'] as String,
      statusOfOrder: map['statusOfOrder'] as String,
      stepperValue: map['stepperValue'] as int,
      totalPrice: map['totalPrice'] as int,
      branchModel:
          map['branchModel'] != null
              ? BranchModel.fromJson(map['branchModel'])
              : null,
      note: map['note'] as String,
      userId: map['userId'] as String,
      products:
          (map['products'] as List<dynamic>).map((item) {
            return CartModel.fromJson(item);
          }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'paymentMethod': paymentMethod,
      'orderedBy': orderedBy,
      'totalPrice': totalPrice,
      'statusOfOrder': statusOfOrder,
      'branchModel': branchModel?.toJson(),
      'stepperValue': stepperValue,
      'note': note,
      'userId': userId,
      'products': products.map((item) => item.toJson()).toList(),
    };
  }
}
