import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/manager/manage_admin/manage_admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAdminViewBody extends StatefulWidget {
  const EditAdminViewBody({super.key, required this.adminModel});
  final AdminModel adminModel;

  @override
  State<EditAdminViewBody> createState() => _EditAdminViewBodyState();
}

class _EditAdminViewBodyState extends State<EditAdminViewBody> {
  String? userName, linkUrl, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomEditTextField(
            maxlines: 1,
            title: 'User Name',
            onChanged: (value) {
              userName = value;
            },
            textEditingController: TextEditingController(
              text: userName ?? widget.adminModel.userName,
            ),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          CustomEditTextField(
            maxlines: 1,
            textEditingController: TextEditingController(
              text: linkUrl ?? widget.adminModel.linkUrl,
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
            textEditingController: TextEditingController(
              text: password ?? widget.adminModel.password,
            ),
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
                value: widget.adminModel.isMainAdmin,
                onChanged: (value) {
                  setState(() {
                    widget.adminModel.isMainAdmin = value!;
                  });
                },
              ),
              Text('Main Admin', style: TextStyles.font18Medium(context)),
            ],
          ),
          CustomBigElevatedBtmWithIcon(
            onPressed: () {
              AdminModel adminModel = AdminModel(
                isMainAdmin: widget.adminModel.isMainAdmin,
                id: widget.adminModel.id,
                userName: userName ?? widget.adminModel.userName,
                linkUrl: linkUrl ?? widget.adminModel.linkUrl,
                password: password ?? widget.adminModel.password,
              );
              BlocProvider.of<ManageAdminCubit>(
                context,
              ).updateAdmin(adminModel: adminModel);
            },
            title: 'Edit',
            iconData: FontAwesomeIcons.floppyDisk,
          ),
        ],
      ),
    );
  }
}
