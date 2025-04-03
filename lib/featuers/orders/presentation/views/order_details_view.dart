import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/order_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // // Navigator.of(context).push(
              // //   MaterialPageRoute(
              // //     builder: (context) {
              // //       return const ManagerUserView();
              // //     },
              // //   ),
              // );
            },
            icon: Icon(IconlyLight.user, color: Colors.white),
          ),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
        ),
        title: Text(
          'Order Details',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: const OrderDetailsViewBody(),
    );
  }
}
