import 'package:flutter/material.dart';

import 'dart:async';

import 'package:reactive_form/view/widget/input_text.dart';
import 'package:reactive_form/view/widget/name_list.dart';

class StreamWidget extends StatelessWidget {
  StreamWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;

  final TextEditingController _nameController = TextEditingController();
  final StreamController<String> streamController =
      StreamController.broadcast();

  void _addName(String n) {
    streamController.sink.add(
      _nameController.text,
    );
  }

  void _clearText(String n) {
    streamController.sink.add('');
  }

  @override
  Widget build(BuildContext context) {
    String name = '';

    return Column(
      children: [
        StreamBuilder(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }
            return Expanded(
              child: NameList(
                label: name,
                onPressed: () => _clearText(name = ''),
              ),
            );
          },
        ),
        const Expanded(child: SizedBox()),
        InputText(
          nameController: _nameController,
          label: label,
          color: Colors.blue,
          onPressed: () {
            _addName(
              name = name + '\n' + _nameController.text,
            );
            _nameController.clear();
          },
        ),
      ],
    );
  }
}
