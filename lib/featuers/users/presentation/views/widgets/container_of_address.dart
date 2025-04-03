import 'package:caffeine_dashboard/core/models/address_model.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/row_of_address_info.dart';
import 'package:flutter/material.dart';

class ContainerOfAddress extends StatelessWidget {
  const ContainerOfAddress({super.key, required this.addressModel});
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Column(
        children: [
          RowOfAddressInfo(title: 'Street: ', subTitle: addressModel.street),
          const SizedBox(height: 10),
          RowOfAddressInfo(title: 'City: ', subTitle: addressModel.city),
          const SizedBox(height: 10),
          RowOfAddressInfo(
            title: 'Phone Number: ',
            subTitle: addressModel.phoneNumber,
          ),
          const SizedBox(height: 10),
          RowOfAddressInfo(title: 'Country: ', subTitle: addressModel.coutry),
        ],
      ),
    );
  }
}
