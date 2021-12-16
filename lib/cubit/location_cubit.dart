import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_json_test/models/location.dart';

import 'location_state.dart';

class LocationCubit extends HydratedCubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  void setLocation(MyCurrentLocation location) {
    /// immediately emit state.
    emit(LocationLoaded(location: location));
  }

  @override
  LocationState? fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return LocationLoaded(location: MyCurrentLocation.fromMap(json));
    }
  }

  @override
  Map<String, dynamic>? toJson(LocationState state) {
    if (state is LocationLoaded) {
      return state.location.toJson();
    }
    return {};
  }
}
