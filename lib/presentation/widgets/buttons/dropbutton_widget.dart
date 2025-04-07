import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      hint: Text(hint),
      items: items
          .map((name) => DropdownMenuItem(
      
                value: name,
                child: Text(name),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
