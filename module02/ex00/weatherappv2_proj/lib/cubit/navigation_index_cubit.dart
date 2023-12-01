import 'package:bloc/bloc.dart';

class NavigationIndexCubit extends Cubit<int> {
  NavigationIndexCubit() : super(0);

  void changeIndex(int newIndex) => emit(newIndex);
}
