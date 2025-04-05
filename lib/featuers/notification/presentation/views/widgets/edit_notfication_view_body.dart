import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/notification/data/models/notification_model.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/manage_notification/manage_notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditNotficationViewBody extends StatefulWidget {
  const EditNotficationViewBody({super.key, required this.notificationModel});
  final NotificationModel notificationModel;

  @override
  State<EditNotficationViewBody> createState() =>
      _EditNotficationViewBodyState();
}

class _EditNotficationViewBodyState extends State<EditNotficationViewBody> {
  String? titleEn, titleAr, bodyEn, bodyAr;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('Edit Title [En]', style: TextStyles.font20SemiBold(context)),
          CustomEditTextField(
            maxlines: 1,

            title: 'Title [En]',
            onChanged: (value) {
              titleEn = value;
            },
            textEditingController: TextEditingController(
              text: titleEn ?? widget.notificationModel.titleEn,
            ),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text('Edit Title [Ar]', style: TextStyles.font20SemiBold(context)),
          CustomEditTextField(
            maxlines: 1,

            title: 'Title [Ar]',
            onChanged: (value) {
              titleAr = value;
            },
            textEditingController: TextEditingController(
              text: titleAr ?? widget.notificationModel.titleAr,
            ),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text(
            'Edit Description [En]',
            style: TextStyles.font20SemiBold(context),
          ),
          CustomEditTextField(
            maxlines: 5,

            title: 'Description [En]',
            onChanged: (value) {
              bodyEn = value;
            },
            textEditingController: TextEditingController(
              text: bodyEn ?? widget.notificationModel.bodyEn,
            ),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text(
            'Edit Description [Ar]',
            style: TextStyles.font20SemiBold(context),
          ),
          CustomEditTextField(
            maxlines: 5,

            title: 'Description [Ar]',
            onChanged: (value) {
              bodyAr = value;
            },
            textEditingController: TextEditingController(
              text: bodyAr ?? widget.notificationModel.bodyAr,
            ),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          CustomBigElevatedBtmWithIcon(
            onPressed: () {
              widget.notificationModel.titleEn =
                  titleEn ?? widget.notificationModel.titleEn;
              widget.notificationModel.titleAr =
                  titleAr ?? widget.notificationModel.titleAr;
              widget.notificationModel.bodyEn =
                  bodyEn ?? widget.notificationModel.bodyEn;
              widget.notificationModel.bodyAr =
                  bodyAr ?? widget.notificationModel.bodyAr;

              BlocProvider.of<ManageNotificationCubit>(
                context,
              ).updateNotification(notification: widget.notificationModel);
            },
            title: 'Save',
            iconData: FontAwesomeIcons.floppyDisk,
          ),
        ],
      ),
    );
  }
}
