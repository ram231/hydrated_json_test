import 'package:equatable/equatable.dart';

class MyCurrentLocation extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  const MyCurrentLocation({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        latitude,
        longitude,
      ];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory MyCurrentLocation.fromMap(Map<String, dynamic> map) {
    return MyCurrentLocation(
      name: map['name'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }
}
