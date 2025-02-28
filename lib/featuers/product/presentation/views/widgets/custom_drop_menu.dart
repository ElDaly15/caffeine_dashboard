import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropMenu extends StatefulWidget {
  const CustomDropMenu({
    super.key,
    required this.items,
    required this.title,
    required this.onChanged,
  });
  final List<String> items;
  final String title;
  final void Function(String?) onChanged;

  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: TextStyles.font18Medium(
                  context,
                ).copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items:
            widget.items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyles.font18Medium(
                        context,
                      ).copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            widget.onChanged(value);
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black26),
            color: AppColors.mainColorTheme,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_forward_ios_outlined),
          iconSize: 14,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.mainColorTheme,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
