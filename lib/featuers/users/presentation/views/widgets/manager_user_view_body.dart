import 'package:caffeine_dashboard/core/utils/app_images.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_address.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_managing_user.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/dialog_alert_of_delete_or_ban.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/list_view_of_user_order_item.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ManagerUserViewBody extends StatelessWidget {
  const ManagerUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(Assets.imagesIcLauncher, scale: 4),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: 'Mazen Eldaly',
              iconData: IconlyLight.profile,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: 'dalydevelopment15@gmail.com',
              iconData: IconlyLight.message,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: ContainerOfAddress()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                ContainerOfManageUserDeleteOrBan(
                  title: 'Delete User',
                  iconData: IconlyBold.delete,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteConfirmDialog(title: 'Delete');
                      },
                    );
                  },
                ),
                SizedBox(width: 10),
                ContainerOfManageUserDeleteOrBan(
                  title: 'Ban User',
                  iconData: Icons.block,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteConfirmDialog(title: 'Ban');
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              'User Orders',
              style: TextStyles.font20SemiBold(context),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          ListViewOfUserOrderItem(),
        ],
      ),
    );
  }
}
