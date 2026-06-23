import 'package:flutter/material.dart';

class SettingsDropdown extends StatelessWidget {
  final List<List<String>> list;
  final String value;
  final ValueChanged<String?> onChanged;
  final String text;
  const SettingsDropdown({
    super.key,
    required this.list,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(text),
        DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          items: list.map<DropdownMenuItem<String>>((List<dynamic> list) {
            return DropdownMenuItem<String>(
              value: list[1],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  list[0],
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.black),
                ),
              ),
            );
          }).toList(),
          selectedItemBuilder: (context) {
            return list.map((e) {
              return Center(
                child: Text(
                  e[0].toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
