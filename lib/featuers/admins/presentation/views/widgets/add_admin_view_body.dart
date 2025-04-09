import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/manager/add_admin/add_admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

class AddAdminViewBody extends StatefulWidget {
  const AddAdminViewBody({super.key});

  @override
  State<AddAdminViewBody> createState() => _AddAdminViewBodyState();
}

class _AddAdminViewBodyState extends State<AddAdminViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? userName, linkUrl, password;
  bool isMainAdmin = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,
              title: 'User Name',
              onChanged: (value) {
                userName = value;
              },
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,
              textEditingController: TextEditingController(
                text:
                    'https://www.kindpng.com/picc/m/475-4750705_school-administrator-icon-png-transparent-png.png',
              ),
              title: 'Link Url',
              onChanged: (value) {
                linkUrl = value;
              },
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Password',
              onChanged: (value) {
                password = value;
              },
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.mainColorTheme,
                  value: isMainAdmin,
                  onChanged: (value) {
                    setState(() {
                      isMainAdmin = value!;
                    });
                  },
                ),
                Text('Main Admin', style: TextStyles.font18Medium(context)),
              ],
            ),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  AdminModel adminModel = AdminModel(
                    isMainAdmin: isMainAdmin,
                    userName: userName!,
                    id: Uuid().v4(),
                    linkUrl:
                        linkUrl ??
                        'https://www.kindpng.com/picc/m/475-4750705_school-administrator-icon-png-transparent-png.png',
                    password: password!,
                  );
                  BlocProvider.of<AddAdminCubit>(context).addAdmin(adminModel);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: 'Add',
              iconData: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ),
    );
  }
}
