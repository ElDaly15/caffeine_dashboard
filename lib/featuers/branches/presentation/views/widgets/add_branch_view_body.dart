import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/add_branch/add_branch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

class AddBranchViewBody extends StatefulWidget {
  const AddBranchViewBody({super.key});

  @override
  State<AddBranchViewBody> createState() => _AddBranchViewBodyState();
}

class _AddBranchViewBodyState extends State<AddBranchViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Branch Name [En]',
                onChanged: (value) {
                  branchNameEn = value;
                },

                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Branch Name [Ar]',
                onChanged: (value) {
                  branchNameAr = value;
                },

                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'City [En]',
                onChanged: (value) {
                  cityEn = value;
                },

                textInputType: TextInputType.text,
              ),

              SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'City [Ar]',
                onChanged: (value) {
                  cityAr = value;
                },

                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Street [En]',
                onChanged: (value) {
                  streetEn = value;
                },

                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Street [Ar]',
                onChanged: (value) {
                  streetAr = value;
                },

                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Country [En]',
                onChanged: (value) {
                  countryEn = value;
                },

                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Country [Ar]',
                onChanged: (value) {
                  countryAr = value;
                },

                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomBigElevatedBtmWithIcon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var uuid = Uuid();
                    BranchModel branchModel = BranchModel(
                      id: uuid.v4(),
                      branchnameEn: branchNameEn!,
                      branchnameAr: branchNameAr!,
                      cityEn: cityEn!,
                      cityAr: cityAr!,
                      countryEn: countryEn!,
                      countryAr: countryAr!,
                      streetEn: streetEn!,
                      streetAr: streetAr!,
                    );
                    BlocProvider.of<AddBranchCubit>(
                      context,
                    ).addBranch(branchModel);
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
      ),
    );
  }
}
