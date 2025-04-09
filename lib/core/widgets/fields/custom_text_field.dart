// ignore_for_file: must_be_immutable

import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.title,
    required this.onChanged,
    required this.obscureText,
    required this.isPassword,
    this.textEditingController,
    required this.textInputType,
    required this.maxlines,
  });
  final String title;
  bool obscureText;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final int maxlines;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.mainColorTheme,
          selectionHandleColor: AppColors.mainColorTheme,
        ),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.title} is required';
          }
          return null;
        },
        keyboardType: widget.textInputType,
        maxLines: widget.maxlines,
        obscureText: widget.obscureText,

        controller: widget.textEditingController,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon: Icon(
                      widget.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.mainColorTheme,
                    ),
                  )
                  : null,
          filled: true,
          // ignore: deprecated_member_use
          fillColor: AppColors.secondaryColorTheme.withOpacity(0.2),
          focusColor: AppColors.mainColorTheme,
          focusedBorder: customOutlineBorder(),
          enabledBorder: customOutlineBorder(),
          border: customOutlineBorder(),
          hintText: widget.title,
          hintStyle: TextStyles.font18Medium(
            context,
          ).copyWith(color: Colors.grey),
          labelStyle: const TextStyle(color: AppColors.mainColorTheme),
        ),
        cursorColor: AppColors.mainColorTheme,
        style: TextStyles.font18Medium(context),
      ),
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 1.3, color: AppColors.mainColorTheme),
    );
  }
}
