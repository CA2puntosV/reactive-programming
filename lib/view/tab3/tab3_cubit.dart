import 'package:bloc/bloc.dart';

class Tab3Cubit extends Cubit<String> {
  Tab3Cubit() : super('');

  void addName(String name) => emit(name);

  void clear(String clear) => emit(clear);
}
