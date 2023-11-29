import 'package:bloc/bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(location: "", locationToggle: false));

  void changeLocation(String newLocation, bool isActive) =>
      emit(LocationState(location: newLocation, locationToggle: isActive));
}
