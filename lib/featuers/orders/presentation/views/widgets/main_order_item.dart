import 'package:caffeine_dashboard/core/models/order_model.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class MainOrderItem extends StatelessWidget {
  const MainOrderItem({
    super.key,
    required this.onTap,
    required this.orderModel,
    required this.itemCount,
  });
  final void Function() onTap;
  final OrderModel orderModel;
  final String itemCount;
  @override
  Widget build(BuildContext context) {
    Timestamp serverTimestamp = orderModel.date;
    DateTime dateTime = serverTimestamp.toDate(); // ✅ Convert to DateTime
    String formattedTime = DateFormat("hh:mm a").format(dateTime);
    String formattedDate = DateFormat("d MMM yyyy").format(dateTime);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainColorTheme,
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                '#$itemCount',
                style: TextStyles.font18Medium(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${orderModel.orderedBy} | ${orderModel.statusOfOrder}',
                  style: TextStyles.font18Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${orderModel.totalPrice} L.E | ${orderModel.paymentMethod}',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$formattedTime | $formattedDate',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
