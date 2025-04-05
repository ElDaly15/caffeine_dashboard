import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/send_notification_to_all_users/send_notification_to_all_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNotificationViewBody extends StatefulWidget {
  const AddNotificationViewBody({super.key});

  @override
  State<AddNotificationViewBody> createState() =>
      _AddNotificationViewBodyState();
}

class _AddNotificationViewBodyState extends State<AddNotificationViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? titleEn, titleAr, bodyEn, bodyAr;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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

                title: 'Title [En]',
                onChanged: (value) {
                  titleEn = value;
                },

                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 1,

                title: 'Title [Ar]',
                onChanged: (value) {
                  titleAr = value;
                },

                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 5,

                title: 'Description [En]',
                onChanged: (value) {
                  bodyEn = value;
                },

                textInputType: TextInputType.text,
              ),

              SizedBox(height: 20),
              CustomEditTextField(
                maxlines: 5,

                title: 'Description [Ar]',
                onChanged: (value) {
                  bodyAr = value;
                },

                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomBigElevatedBtmWithIcon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await BlocProvider.of<SendNotificationToAllUsersCubit>(
                      context,
                    ).sendNotificationToAllUsers(
                      '',
                      titleEn!,
                      titleAr!,
                      bodyEn!,
                      bodyAr!,
                    );
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
