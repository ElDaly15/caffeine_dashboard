import 'package:caffeine_dashboard/featuers/users/data/models/user_model.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/manager_user_view.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/custom_cotaniner_of_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfUsersItems extends StatelessWidget {
  const ListViewOfUsersItems({super.key, required this.users});
  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: CustomContainerOfUserItem(
            user: users[index],
            onTap: () {
              BlocProvider.of<GetUserDataCubit>(
                context,
              ).getUserData(uid: users[index].uid);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ManagerUserView(user: users[index]);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
