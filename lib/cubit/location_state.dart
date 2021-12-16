import 'package:equatable/equatable.dart';
import 'package:hydrated_json_test/models/location.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final MyCurrentLocation location;
  const LocationLoaded({
    required this.location,
  });

  @override
  List<Object?> get props => [location];
}
