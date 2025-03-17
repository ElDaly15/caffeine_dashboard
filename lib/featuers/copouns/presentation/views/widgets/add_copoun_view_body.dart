import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/copouns/data/model/coupon_model.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/manage_copouns/manage_copouns_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/manage_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:uuid/uuid.dart';

class AddCopounViewBody extends StatefulWidget {
  const AddCopounViewBody({super.key});

  @override
  State<AddCopounViewBody> createState() => _AddCopounViewBodyState();
}

class _AddCopounViewBodyState extends State<AddCopounViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int index = 0;
  num value = 0.1;
  String? title, code;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Copoun Title',
              onChanged: (value) {
                title = value;
              },
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomEditTextField(
              maxlines: 1,

              title: 'Copoun Code',
              onChanged: (value) {
                code = value;
              },
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ManageOrderContainer(
                    isActive: index == 0,
                    title: '10 % Off',
                    onTap: () {
                      setState(() {
                        index = 0;
                        value = 0.1;
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
                        value = 0.2;
                      });
                    },
                    isActive: index == 1,
                    title: '20 % Off',
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        index = 2;
                        value = 0.3;
                      });
                    },
                    isActive: index == 2,
                    title: '30 % Off',
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        index = 3;
                        value = 0.5;
                      });
                    },
                    isActive: index == 3,
                    title: '50 % Off',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var uuid = Uuid();
                  CouponModel couponModel = CouponModel(
                    copounTitle: title!,
                    users: [],
                    isExpired: false,
                    copounCode: code!,

                    id: uuid.v4(),
                    copounValue: value,
                  );
                  BlocProvider.of<ManageCopounsCubit>(
                    context,
                  ).addCopoun(couponModel);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: 'Add Copoun',
              iconData: IconlyBold.plus,
            ),
          ],
        ),
      ),
    );
  }
}
