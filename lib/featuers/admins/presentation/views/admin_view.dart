import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/search_admin.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/widgets/admin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchAdmin();
                  },
                ),
              );
            },
            icon: Icon(IconlyLight.search, color: Colors.white),
          ),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
        ),
        title: Text(
          'Admins',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: const AdminViewBody(),
    );
  }
}
