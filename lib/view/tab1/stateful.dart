import 'package:flutter/material.dart';

import 'package:reactive_form/view/widget/input_text.dart';
import 'package:reactive_form/view/widget/name_list.dart';

class StateFulWidget extends StatefulWidget {
  const StateFulWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  State<StateFulWidget> createState() => _StateFulWidgetState();
}

class _StateFulWidgetState extends State<StateFulWidget> {
  final TextEditingController _nameController = TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: NameList(
            label: name,
            onPressed: () => setState(() {
              name = '';
            }),
          ),
        ),
        InputText(
          nameController: _nameController,
          label: widget.label,
          color: Colors.orange,
          onPressed: () {
            setState(() {
              name = name + '\n' + _nameController.text;
              _nameController.clear();
            });
          },
        ),
      ],
    );
  }
}
