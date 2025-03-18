import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/delete_branch/delete_branch_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/views/edit_branch_view.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/views/widgets/branch_item.dart';
import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverListOfBranches extends StatelessWidget {
  const SliverListOfBranches({super.key, required this.branches});
  final List<BranchModel> branches;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: branches.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: BranchItem(
            branchModel: branches[index],
            onDelete: () {
              showDialog(
                context: context,
                builder:
                    (context) => DialogOfDelete(
                      onDelete: () {
                        BlocProvider.of<DeleteBranchCubit>(
                          context,
                        ).deleteBranch(id: branches[index].id);
                        Navigator.pop(context);
                      },
                      title: 'Delete Branch',
                      subTitle: 'branch',
                    ),
              );
            },
            onEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => EditBranchView(branchModel: branches[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
