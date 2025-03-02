import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/edit_copoun_view.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/main_copoun_container.dart';
import 'package:flutter/material.dart';

class SliverListOfCopouns extends StatelessWidget {
  const SliverListOfCopouns({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: MainCopounContainer(
            onTapDelete: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogOfDelete(
                    title: 'Delete Copoun',
                    subTitle: 'copoun',
                    onDelete: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            onTapEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditCopounView()),
              );
            },
          ),
        );
      },
    );
  }
}
