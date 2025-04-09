import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/manager/manage_admin/manage_admin_cubit.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/edit_admin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class AdminItem extends StatelessWidget {
  const AdminItem({super.key, required this.adminModel});
  final AdminModel adminModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainColorTheme,
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
              errorWidget:
                  (context, url, error) =>
                      const Icon(Icons.error, size: 40, color: Colors.white),
              imageUrl: adminModel.linkUrl, // Replace with actual image URL
              width: 50,
              fit: BoxFit.cover,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name : ${adminModel.userName}', // Replace with actual admin name
                  style: TextStyles.font18Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Password : ${adminModel.password}',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Visibility(
                  visible: adminModel.isMainAdmin,
                  child: Text(
                    'Main Admin ⭐',
                    style: TextStyles.font14Medium(
                      context,
                    ).copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return EditAdminView(adminModel: adminModel);
                  },
                ),
              );
            },
            icon: Icon(IconlyBold.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => DialogOfDelete(
                      onDelete: () {
                        Navigator.pop(context);
                        BlocProvider.of<ManageAdminCubit>(
                          context,
                        ).deleteAdmin(adminModel: adminModel);
                      },
                      title: 'Delete Admin',
                      subTitle: 'admin',
                    ),
              );
            },
            icon: Icon(IconlyBold.delete, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
