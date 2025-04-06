// ignore_for_file: use_build_context_synchronously

import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/manager/get_order_by_id/get_order_by_id_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/manager/update_order_status/update_order_status_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/manage_order_container.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sliver_of_sub_orders_item.dart';
import 'package:caffeine_dashboard/featuers/users/data/models/user_model.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key, required this.userModel});
  final UserModel userModel;

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
              state.orderModel.note != ''
                  ? SliverToBoxAdapter(child: SizedBox(height: 10))
                  : SliverToBoxAdapter(),
              state.orderModel.note != ''
                  ? SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    sliver: SliverToBoxAdapter(
                      child: CustomCotnainerOfUserInfo(
                        title: 'Note : ${state.orderModel.note}',
                        iconData: IconlyLight.edit_square,
                      ),
                    ),
                  )
                  : SliverToBoxAdapter(),
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
                  child:
                      state.orderModel.orderedBy == 'Delivery'
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ManageOrderContainer(
                                  isActive: state.orderModel.stepperValue == 0,
                                  title: 'Pending',
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, your order is pending',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Your Order is Pending',
                                    );
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ManageOrderContainer(
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).updateOrderStatus(
                                      orderId: state.orderModel.orderId,
                                      userId: state.orderModel.userId,
                                      step: 2,
                                      statusOfOrder: 'On The Way',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Your Order is On The Way To ${widget.userModel.address[0].street} , ${widget.userModel.address[0].city} , ${widget.userModel.address[0].coutry} , Wait For It',
                                    );
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                  isActive: state.orderModel.stepperValue == 2,
                                  title: 'Out For Delivery',
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ManageOrderContainer(
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).updateOrderStatus(
                                      orderId: state.orderModel.orderId,
                                      userId: state.orderModel.userId,
                                      step: 3,
                                      statusOfOrder: 'Delivered ',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Your Order is Delivered , Enjoy',
                                    );
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                  isActive: state.orderModel.stepperValue == 3,
                                  title: 'Delivered',
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ManageOrderContainer(
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).updateOrderStatus(
                                      orderId: state.orderModel.orderId,
                                      userId: state.orderModel.userId,
                                      step: -1,
                                      statusOfOrder: 'Cancelled',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Sorry Your Order is Cancelled :(',
                                    );
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                  isActive: state.orderModel.stepperValue == -1,
                                  title: 'Cancelled',
                                ),
                              ),
                            ],
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ManageOrderContainer(
                                  isActive: state.orderModel.stepperValue == 0,
                                  title: 'Pending',
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).updateOrderStatus(
                                      orderId: state.orderModel.orderId,
                                      userId: state.orderModel.userId,
                                      step: 0,
                                      statusOfOrder: 'Pending',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Your Order is Pending',
                                    );
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ManageOrderContainer(
                                  isActive: state.orderModel.stepperValue == 3,
                                  title: 'Delivered',
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).updateOrderStatus(
                                      orderId: state.orderModel.orderId,
                                      userId: state.orderModel.userId,
                                      step: 3,
                                      statusOfOrder: 'Delivered',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Your Order is Delivered , Enjoy',
                                    );
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ManageOrderContainer(
                                  isActive: state.orderModel.stepperValue == -1,
                                  title: 'Cancelled',
                                  onTap: () async {
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).updateOrderStatus(
                                      orderId: state.orderModel.orderId,
                                      userId: state.orderModel.userId,
                                      step: -1,
                                      statusOfOrder: 'Cancelled',
                                    );
                                    await BlocProvider.of<
                                      UpdateOrderStatusCubit
                                    >(context).sendNotificationToSpecificUser(
                                      '',
                                      widget.userModel.notificationToken,
                                      context,
                                      'Order Status Updated',
                                      'Hello ${widget.userModel.name}, Sorry Your Order is Cancelled :(',
                                    );
                                    setState(() {
                                      index = 0;
                                    });
                                  },
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
