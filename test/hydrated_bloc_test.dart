import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_json_test/cubit/location_cubit.dart';
import 'package:hydrated_json_test/cubit/location_state.dart';
import 'package:hydrated_json_test/models/location.dart';
import 'package:mocktail/mocktail.dart';

const latitude = 24.0;
const longitude = 25.0;
const name = 'test';

class MockStorage extends Mock implements Storage {}

class MockCurrentLocation extends Mock implements MyCurrentLocation {}

T mockHydratedStorage<T>(T Function() body, {Storage? storage}) {
  return HydratedBlocOverrides.runZoned<T>(
    body,
    storage: storage ?? _buildMockStorage(),
  );
}

Storage _buildMockStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  return storage;
}

void main() {
  group(
    "Emit and save mock locations from hydrated bloc",
    () {
      late MockCurrentLocation location;

      setUp(() {
        location = MockCurrentLocation();
        when(() => location.latitude).thenReturn(latitude);
        when(() => location.longitude).thenReturn(longitude);
        when(() => location.name).thenReturn(name);

        /// Uncomment this to make the test pass.
        // when(() => location.toJson()).thenReturn({
        //   "name": latitude,
        //   "latitude": latitude,
        //   "longitude": longitude,
        // });
      });

      blocTest<LocationCubit, LocationState>(
        "Emit LocationLoaded",
        build: () => mockHydratedStorage(() => LocationCubit()),
        act: (cubit) => cubit.setLocation(location),
        expect: () => [LocationLoaded(location: location)],
      );
    },
  );
}
