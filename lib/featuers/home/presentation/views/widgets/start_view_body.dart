import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_text_field.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/manager/check_user_login/check_user_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomStartViewBdoy extends StatefulWidget {
  const CustomStartViewBdoy({super.key});

  @override
  State<CustomStartViewBdoy> createState() => _CustomStartViewBdoyState();
}

class _CustomStartViewBdoyState extends State<CustomStartViewBdoy> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  String? userName, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Caffeine Dashboard',
              style: TextStyles.font22SemiBold(
                context,
              ).copyWith(color: AppColors.mainColorTheme),
            ),
            Text(
              'Welcome to Caffeine Dashboard',
              style: TextStyles.font22SemiBold(
                context,
              ).copyWith(color: AppColors.mainColorTheme),
            ),

            const SizedBox(height: 20),

            CustomTextField(
              title: 'User Name',
              onChanged: (value) {
                userName = value;
              },
              obscureText: false,
              isPassword: false,
              textInputType: TextInputType.text,
              maxlines: 1,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'Password',
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              isPassword: true,
              textInputType: TextInputType.text,
              maxlines: 1,
            ),
            const SizedBox(height: 20),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<CheckUserLoginCubit>().checkUserLogin(
                    userName: userName!,
                    password: password!,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: 'Login',
              iconData: FontAwesomeIcons.arrowRightToBracket,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
