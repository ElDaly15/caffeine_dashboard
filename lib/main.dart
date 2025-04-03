import 'package:caffeine_dashboard/featuers/ads/presentation/manager/add_ads/add_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/delete_ads/delete_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/get_ad_by_id/get_ad_by_id_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/get_ads/get_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/update_ads/update_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/add_branch/add_branch_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/delete_branch/delete_branch_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/edit_branch/edit_branch_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/get_branches/get_branches_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/delete_copoun/delete_copoun_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/edit_copoun/edit_copoun_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/manage_copouns/manage_copouns_cubit.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/delete_product/delete_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/get_products/get_products_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/update_product/update_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/ban_user/ban_user_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_users/get_users_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/search_user/search_user_cubit.dart';
import 'package:caffeine_dashboard/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const CaffeineDashboardApp(),
    ),
  );
}

class CaffeineDashboardApp extends StatelessWidget {
  const CaffeineDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetProductsCubit()..getProducts()),
        BlocProvider(create: (context) => GetProductByCodeCubit()),
        BlocProvider(create: (context) => UpdateProductCubit()),
        BlocProvider(create: (context) => SearchProductsCubit()),
        BlocProvider(create: (context) => DeleteProductCubit()),
        BlocProvider(create: (context) => AddAdsCubit()),
        BlocProvider(create: (context) => GetAdsCubit()..getAds()),
        BlocProvider(create: (context) => GetAdByIdCubit()),
        BlocProvider(create: (context) => UpdateAdsCubit()),
        BlocProvider(create: (context) => DeleteAdsCubit()),
        BlocProvider(create: (context) => ManageCopounsCubit()..getCopouns()),
        BlocProvider(create: (context) => DeleteCopounCubit()),
        BlocProvider(create: (context) => EditCopounCubit()),
        BlocProvider(create: (context) => AddBranchCubit()),
        BlocProvider(create: (context) => GetBranchesCubit()..getBranches()),
        BlocProvider(create: (context) => EditBranchCubit()),
        BlocProvider(create: (context) => DeleteBranchCubit()),
        BlocProvider(create: (context) => GetUsersCubit()..getUsers()),
        BlocProvider(create: (context) => GetUserDataCubit()),
        BlocProvider(create: (context) => SearchUserCubit()),
        BlocProvider(create: (context) => BanUserCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: HomeView(),
      ),
    );
  }
}
