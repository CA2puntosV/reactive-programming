import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reactive_form/view/tab3/tab3_cubit.dart';
import 'package:reactive_form/view/widget/input_text.dart';
import 'package:reactive_form/view/widget/name_list.dart';

class CubitWidget extends StatelessWidget {
  CubitWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Tab3Cubit(),
      child: BlocBuilder<Tab3Cubit, String>(
        builder: (context, state) {
          final _tab3Cubit = context.read<Tab3Cubit>();
          return Column(
            children: <Widget>[
              Expanded(
                child: NameList(
                  label: state,
                  onPressed: () => _tab3Cubit.clear(
                    state = '',
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              InputText(
                nameController: _nameController,
                label: label,
                color: Colors.green,
                onPressed: () {
                  _tab3Cubit.addName(
                    state = state + '\n' + _nameController.text,
                  );
                  _nameController.clear();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
