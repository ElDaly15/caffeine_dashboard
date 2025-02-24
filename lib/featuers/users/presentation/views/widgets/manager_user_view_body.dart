import 'package:caffeine_dashboard/core/utils/app_images.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_address.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/list_view_of_user_order_item.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ManagerUserViewBody extends StatelessWidget {
  const ManagerUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(Assets.imagesIcLauncher, scale: 4),
            ),
          ),
          const SizedBox(height: 20),
          CustomCotnainerOfUserInfo(
            title: 'Mazen Eldaly',
            iconData: IconlyLight.profile,
          ),
          const SizedBox(height: 20),
          CustomCotnainerOfUserInfo(
            title: 'dalydevelopment15@gmail.com',
            iconData: IconlyLight.message,
          ),
          const SizedBox(height: 20),
          ContainerOfAddress(),
          const SizedBox(height: 20),
          Text('User Orders', style: TextStyles.font20SemiBold(context)),
          const SizedBox(height: 10),
          ListViewOfUserOrderItem(),
        ],
      ),
    );
  }
}
