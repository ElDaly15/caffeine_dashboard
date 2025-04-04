import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/manager/get_order_by_id/get_order_by_id_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/manage_order_container.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sliver_of_sub_orders_item.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key});

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderByIdCubit, GetOrderByIdState>(
      builder: (context, state) {
        if (state is GetOrderByIdSuccess) {
          Timestamp serverTimestamp = state.orderModel.date;
          DateTime dateTime = serverTimestamp.toDate(); // ✅ Convert to DateTime
          String formattedTime = DateFormat("hh:mm a").format(dateTime);
          String formattedDate = DateFormat("d MMM yyyy").format(dateTime);
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Order Info',
                    style: TextStyles.font20Medium(context),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title: state.orderModel.orderId,
                    iconData: Icons.qr_code,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title: '${state.orderModel.totalPrice} EGP',
                    iconData: IconlyLight.wallet,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title: '$formattedTime | $formattedDate',
                    iconData: IconlyLight.time_circle,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title:
                        state.orderModel.orderedBy == 'Delivery'
                            ? 'Delivery'
                            : 'Pickup - [${state.orderModel.branchModel!.branchnameEn}]',
                    iconData: IconlyLight.location,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: CustomCotnainerOfUserInfo(
                    title: state.orderModel.statusOfOrder,
                    iconData: IconlyLight.info_circle,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Order Details',
                    style: TextStyles.font20Medium(context),
                  ),
                ),
              ),
              SliverOfSubOrdersItem(products: state.orderModel.products),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Manage Order Status',
                    style: TextStyles.font20Medium(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ManageOrderContainer(
                          isActive: index == 0,
                          title: 'Pending',
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: ManageOrderContainer(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          isActive: index == 1,
                          title: 'Out For Delivery',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: ManageOrderContainer(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          isActive: index == 2,
                          title: 'Delivered',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: ManageOrderContainer(
                          onTap: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          isActive: index == 3,
                          title: 'Cancelled',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          );
        } else if (state is GetOrderByIdLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainColorTheme),
          );
        } else {
          return Center(
            child: Text(
              'An error occurred while fetching orders',
              style: TextStyles.font20Regular(
                context,
              ).copyWith(color: AppColors.mainColorTheme),
            ),
          );
        }
      },
    );
  }
}
