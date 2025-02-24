import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/row_of_address_info.dart';
import 'package:flutter/material.dart';

class ContainerOfAddress extends StatelessWidget {
  const ContainerOfAddress({super.key});

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
          RowOfAddressInfo(title: 'Street: ', subTitle: '9 Street - Giza'),
          const SizedBox(height: 10),
          RowOfAddressInfo(title: 'City: ', subTitle: 'Cairo'),
          const SizedBox(height: 10),
          RowOfAddressInfo(title: 'Phone Number: ', subTitle: '010005005414'),
          const SizedBox(height: 10),
          RowOfAddressInfo(title: 'Country: ', subTitle: 'Egypt'),
        ],
      ),
    );
  }
}
