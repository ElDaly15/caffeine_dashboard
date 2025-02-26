import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogOfDelete extends StatefulWidget {
  const DialogOfDelete({super.key, required this.title});
  final String title;
  @override
  State<DialogOfDelete> createState() => _DeleteConfirmDialogState();
}

class _DeleteConfirmDialogState extends State<DialogOfDelete> {
  String? deleteText;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth > 600 ? 400.0 : screenWidth * 0.9;
    final dialogHeight = screenWidth > 600 ? 200.0 : 210.0;

    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: dialogWidth,
        height: dialogHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alert',
                style: TextStyles.font18Bold(
                  context,
                ).copyWith(color: Colors.red),
              ),
              const SizedBox(height: 10),
              Text(
                'Are You Sure You Want to delete this notification ?',
                style: TextStyles.font14SemiBold(context),
              ),
              const SizedBox(height: 10),

              Text(
                'To Confirm, Press "Buttom" in the  below.',
                style: TextStyles.font18Bold(
                  context,
                ).copyWith(color: Colors.red),
              ),
              Spacer(),

              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '${widget.title} ',
                      style: TextStyles.font14Medium(
                        context,
                      ).copyWith(color: AppColors.secondaryColorTheme),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyles.font14Medium(
                        context,
                      ).copyWith(color: AppColors.darkTheme),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
