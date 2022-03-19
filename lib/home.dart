import 'package:flutter/material.dart';
import 'package:reactive_form/view/tab3/cubit.dart';
import 'package:reactive_form/view/tab1/stateful.dart';
import 'package:reactive_form/view/tab2/stream.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFD8D78F),
          title: const Text('Reactive Programming'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'StateFul',
              ),
              Tab(
                text: 'Stream',
              ),
              Tab(
                text: 'Cubit',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const StateFulWidget(
              label: 'Añadir en StateFul',
            ),
            StreamWidget(
              label: 'Añadir en Stream',
            ),
            CubitWidget(
              label: 'Añadir en Cubit',
            ),
          ],
        ),
      ),
    );
  }
}
