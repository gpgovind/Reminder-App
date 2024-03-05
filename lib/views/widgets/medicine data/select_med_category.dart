import 'package:flutter/material.dart';

class SelectMedCategory extends StatefulWidget {
  final Function(String) category;

  const SelectMedCategory({super.key, required this.category});

  @override
  State<SelectMedCategory> createState() => _SelectMedCategoryState();
}

class _SelectMedCategoryState extends State<SelectMedCategory> {
  String selectedOption = 'capsule';
  @override
  void initState() {
    super.initState();
    widget.category(selectedOption);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RadioListTile(
            title: const Text('Capsule'),
            activeColor: Colors.green[500],
            value: 'capsule',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                widget.category(value);
              });
            },
          ),
          RadioListTile(
            activeColor: Colors.green[500],
            title: const Text('Tablet'),
            value: 'tablet',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                widget.category(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
