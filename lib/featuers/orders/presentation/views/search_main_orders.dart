import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/search_main_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchMainOrders extends StatefulWidget {
  const SearchMainOrders({super.key});

  @override
  State<SearchMainOrders> createState() => _SearchMainOrdersState();
}

class _SearchMainOrdersState extends State<SearchMainOrders> {
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        backgroundColor: AppColors.mainColorTheme.withOpacity(0.3),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.mainColorTheme,
            child: IconButton(
              alignment: Alignment.center,
              icon: const Icon(IconlyLight.arrow_left_2),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: TextSelectionTheme(
          data: const TextSelectionThemeData(
            cursorColor: AppColors.mainColorTheme,
            selectionColor: AppColors.mainColorTheme,
            selectionHandleColor: AppColors.mainColorTheme,
          ),
          child: TextField(
            focusNode: focusNode,
            onChanged: (value) {},
            cursorColor: AppColors.mainColorTheme,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Search Orders',
              hintStyle: TextStyles.font20Medium(
                context,
              ).copyWith(color: AppColors.darkTheme),
            ),
            style: TextStyles.font20Medium(
              context,
            ).copyWith(color: AppColors.darkTheme),
          ),
        ),
      ),
      body: const SearchMainOrdersViewBody(),
    );
  }
}
