import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/edit_branch/edit_branch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditBranchViewBody extends StatefulWidget {
  const EditBranchViewBody({super.key, required this.branchModel});
  final BranchModel branchModel;

  @override
  State<EditBranchViewBody> createState() => _EditBranchViewBodyState();
}

class _EditBranchViewBodyState extends State<EditBranchViewBody> {
  String? branchNameEn,
      branchNameAr,
      cityEn,
      cityAr,
      streetEn,
      streetAr,
      countryEn,
      countryAr;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Edit Branch Name [En]',
              style: TextStyles.font20SemiBold(context),
            ),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit Branch Name [En]',
              onChanged: (value) {
                branchNameEn = value;
              },
              textEditingController: TextEditingController(
                text: branchNameEn ?? widget.branchModel.branchnameEn,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text(
              'Edit Branch Name [Ar]',
              style: TextStyles.font20SemiBold(context),
            ),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit Branch Name [Ar]',
              onChanged: (value) {
                branchNameAr = value;
              },
              textEditingController: TextEditingController(
                text: branchNameAr ?? widget.branchModel.branchnameAr,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text('Edit City [En]', style: TextStyles.font20SemiBold(context)),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit City [En]',
              onChanged: (value) {
                cityEn = value;
              },
              textEditingController: TextEditingController(
                text: cityEn ?? widget.branchModel.cityEn,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text('Edit City [Ar]', style: TextStyles.font20SemiBold(context)),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit City [Ar]',
              onChanged: (value) {
                cityAr = value;
              },
              textEditingController: TextEditingController(
                text: cityAr ?? widget.branchModel.cityAr,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text('Edit Street [En]', style: TextStyles.font20SemiBold(context)),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit Street [En]',
              onChanged: (value) {
                streetEn = value;
              },
              textEditingController: TextEditingController(
                text: streetEn ?? widget.branchModel.streetEn,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text('Edit Street [Ar]', style: TextStyles.font20SemiBold(context)),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit Street [Ar]',
              onChanged: (value) {
                streetAr = value;
              },
              textEditingController: TextEditingController(
                text: streetAr ?? widget.branchModel.streetAr,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text(
              'Edit Country [En]',
              style: TextStyles.font20SemiBold(context),
            ),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit Country [En]',
              onChanged: (value) {
                countryEn = value;
              },
              textEditingController: TextEditingController(
                text: countryEn ?? widget.branchModel.countryEn,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text(
              'Edit Country [Ar]',
              style: TextStyles.font20SemiBold(context),
            ),
            CustomEditTextField(
              maxlines: 1,

              title: 'Edit Country [Ar]',
              onChanged: (value) {
                countryAr = value;
              },
              textEditingController: TextEditingController(
                text: countryAr ?? widget.branchModel.countryAr,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                BranchModel branchModel = BranchModel(
                  id: widget.branchModel.id,
                  branchnameEn: branchNameEn ?? widget.branchModel.branchnameEn,
                  branchnameAr: branchNameAr ?? widget.branchModel.branchnameAr,
                  cityEn: cityEn ?? widget.branchModel.cityEn,
                  cityAr: cityAr ?? widget.branchModel.cityAr,
                  countryEn: countryEn ?? widget.branchModel.countryEn,
                  countryAr: countryAr ?? widget.branchModel.countryAr,
                  streetEn: streetEn ?? widget.branchModel.streetEn,
                  streetAr: streetAr ?? widget.branchModel.streetAr,
                );

                BlocProvider.of<EditBranchCubit>(
                  context,
                ).editBranch(branchmodel: branchModel);
              },
              title: 'Save',
              iconData: FontAwesomeIcons.floppyDisk,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
