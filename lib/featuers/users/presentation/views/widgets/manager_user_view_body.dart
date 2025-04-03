import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/ban_user/ban_user_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_address.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_managing_user.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/dialog_alert_of_delete_or_ban.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/list_view_of_user_order_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class ManagerUserViewBody extends StatefulWidget {
  const ManagerUserViewBody({super.key});

  @override
  State<ManagerUserViewBody> createState() => _ManagerUserViewBodyState();
}

class _ManagerUserViewBodyState extends State<ManagerUserViewBody> {
  Future<bool> isUserBanned(String userId) async {
    DocumentSnapshot banDoc =
        await FirebaseFirestore.instance
            .collection('banned_users')
            .doc(userId)
            .get();
    return banDoc.exists;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(
                              Icons.error,
                              size: 40,
                              color: Colors.white,
                            ),
                        imageUrl: state.userModel.image,
                        width: 130,
                        fit: BoxFit.cover,
                        height: 130,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title: state.userModel.name,
                    iconData: IconlyLight.profile,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title: state.userModel.email,
                    iconData: IconlyLight.message,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                state.userModel.address.isEmpty
                    ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: Text(
                            'No address found',
                            style: TextStyles.font20Regular(
                              context,
                            ).copyWith(color: AppColors.mainColorTheme),
                          ),
                        ),
                      ),
                    )
                    : SliverToBoxAdapter(
                      child: ContainerOfAddress(
                        addressModel: state.userModel.address[0],
                      ),
                    ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: StreamBuilder<DocumentSnapshot>(
                    stream:
                        FirebaseFirestore.instance
                            .collection('banned_users')
                            .doc(state.userModel.uid)
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainColorTheme,
                          ),
                        );
                      }

                      final bool isBanned = snapshot.data?.exists ?? false;

                      return Row(
                        children: [
                          ContainerOfManageUserDeleteOrBan(
                            title: 'Delete User',
                            iconData: IconlyBold.delete,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DeleteConfirmDialog(
                                    title: 'Delete',
                                    onConfirm: () {},
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(width: 10),

                          isBanned
                              ? ContainerOfManageUserDeleteOrBan(
                                title: 'Unban User',
                                iconData: Icons.lock_open,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DeleteConfirmDialog(
                                        title: 'Unban',
                                        onConfirm: () {
                                          Navigator.pop(context);
                                          BlocProvider.of<BanUserCubit>(
                                            context,
                                          ).unbanUser(state.userModel.uid);
                                        },
                                      );
                                    },
                                  );
                                },
                              )
                              : ContainerOfManageUserDeleteOrBan(
                                title: 'Ban User',
                                iconData: Icons.block,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DeleteConfirmDialog(
                                        title: 'Ban',
                                        onConfirm: () {
                                          Navigator.pop(context);
                                          BlocProvider.of<BanUserCubit>(
                                            context,
                                          ).banUser(
                                            state.userModel.uid,
                                            'Manager',
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                        ],
                      );
                    },
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
                state.userModel.orders.isEmpty
                    ? SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          'No orders found',
                          style: TextStyles.font20Regular(
                            context,
                          ).copyWith(color: AppColors.mainColorTheme),
                        ),
                      ),
                    )
                    : ListViewOfUserOrderItem(orders: state.userModel.orders),
              ],
            );
          } else if (state is GetUserDataFailuer) {
            return Center(
              child: Text(
                state.error,
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            );
          }
        },
      ),
    );
  }
}
