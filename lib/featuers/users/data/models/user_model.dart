import 'package:caffeine_dashboard/core/models/address_model.dart';
import 'package:caffeine_dashboard/core/models/cart_model.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/core/models/order_model.dart';
import 'package:caffeine_dashboard/featuers/users/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uid,
    required super.address,
    required super.note,
    required super.orders,
    required super.notificationToken,
    required super.image,
    required super.favProducts,
    required super.cartItems,
  });

  factory UserModel.fromFireStore(Map<String, dynamic> doc) {
    return UserModel(
      note: doc['note'],
      notificationToken: doc['notificationToken'],
      email: doc['email'],
      image: doc['image'],
      name: doc['name'],
      favProducts:
          (doc['favoritProduct'] as List<dynamic>).map((item) {
            return ProductModel.fromJson(item);
          }).toList(),
      uid: doc['uid'],
      orders:
          (doc['Orders'] as List<dynamic>).map((item) {
              return OrderModel.fromMap(item);
            }).toList()
            ..sort(
              (a, b) => b.date.compareTo(a.date),
            ), // Sort orders by time (latest first)
      address:
          (doc['address'] as List<dynamic>).map((item) {
            return AddressModel.fromJson(item);
          }).toList(),
      cartItems:
          (doc['cartItems'] as List<dynamic>).map((item) {
            return CartModel.fromJson(item);
          }).toList(),
    );
  }
}
