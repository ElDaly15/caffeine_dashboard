import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BranchItem extends StatelessWidget {
  const BranchItem({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.branchModel,
  });
  final void Function()? onDelete;
  final void Function()? onEdit;
  final BranchModel branchModel;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(IconlyBold.location, color: AppColors.mainColorTheme, size: 30),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      branchModel.branchnameEn,
                      style: TextStyles.font20SemiBold(context).copyWith(),
                    ),
                    Spacer(),
                  ],
                ),
                Text(
                  '${branchModel.streetEn} , ${branchModel.cityEn} , ${branchModel.countryEn}',
                  style: TextStyles.font18Regular(context).copyWith(),

                  maxLines: null,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(IconlyBold.delete, color: Colors.red),
          ),
          IconButton(
            onPressed: onEdit,
            icon: Icon(IconlyBold.edit, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
