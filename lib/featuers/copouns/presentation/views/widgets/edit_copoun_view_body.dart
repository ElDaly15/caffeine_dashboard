import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/copouns/data/model/coupon_model.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/edit_copoun/edit_copoun_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/manage_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class EditCopounViewBody extends StatefulWidget {
  const EditCopounViewBody({super.key, required this.couponModel});
  final CouponModel couponModel;

  @override
  State<EditCopounViewBody> createState() => _EditCopounViewBodyState();
}

class _EditCopounViewBodyState extends State<EditCopounViewBody> {
  int index = 0;
  String? title, code;
  num? copounValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Copoun Title',
              onChanged: (value) {
                title = value;
              },
              textEditingController: TextEditingController(
                text: title ?? widget.couponModel.copounTitle,
              ),
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomEditTextField(
              maxlines: 1,

              title: 'Copoun Code',
              onChanged: (value) {
                code = value;
              },
              textEditingController: TextEditingController(
                text: code ?? widget.couponModel.copounCode,
              ),
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Expired ?', style: TextStyles.font20SemiBold(context)),
                Spacer(),
                Switch(
                  value: widget.couponModel.isExpired,
                  hoverColor: AppColors.mainColorTheme,
                  activeColor: AppColors.mainColorTheme,
                  onChanged: (value) {
                    setState(() {
                      widget.couponModel.isExpired = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ManageOrderContainer(
                    isActive: widget.couponModel.copounValue == 0.1,
                    title: '10 % Off',
                    onTap: () {
                      setState(() {
                        widget.couponModel.copounValue = 0.1;
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
                        widget.couponModel.copounValue = 0.2;
                        index = 1;
                      });
                    },
                    isActive: widget.couponModel.copounValue == 0.2,
                    title: '20 % Off',
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        widget.couponModel.copounValue = 0.3;
                        index = 2;
                      });
                    },
                    isActive: widget.couponModel.copounValue == 0.3,
                    title: '30 % Off',
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        widget.couponModel.copounValue = 0.5;
                        index = 3;
                      });
                    },
                    isActive: widget.couponModel.copounValue == 0.5,
                    title: '50 % Off',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                widget.couponModel.copounTitle =
                    title ?? widget.couponModel.copounTitle;
                widget.couponModel.copounCode =
                    code ?? widget.couponModel.copounCode;
                widget.couponModel.copounValue =
                    copounValue ?? widget.couponModel.copounValue;
                BlocProvider.of<EditCopounCubit>(
                  context,
                ).editCopoun(copounModel: widget.couponModel);
              },
              title: 'Edit Copoun',
              iconData: IconlyBold.edit,
            ),
          ],
        ),
      ),
    );
  }
}
