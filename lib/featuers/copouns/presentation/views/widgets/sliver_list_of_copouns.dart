import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/copouns/data/model/coupon_model.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/delete_copoun/delete_copoun_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/edit_copoun_view.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/main_copoun_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverListOfCopouns extends StatelessWidget {
  const SliverListOfCopouns({super.key, required this.coupons});
  final List<CouponModel> coupons;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: MainCopounContainer(
            couponModel: coupons[index],
            onTapDelete: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogOfDelete(
                    title: 'Delete Copoun',
                    subTitle: 'copoun',
                    onDelete: () {
                      Navigator.pop(context);
                      BlocProvider.of<DeleteCopounCubit>(
                        context,
                      ).deleteCopoun(id: coupons[index].id);
                    },
                  );
                },
              );
            },
            onTapEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => EditCopounView(couponModel: coupons[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
