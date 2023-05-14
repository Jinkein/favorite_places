import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final placesProvider = Provider(
//   (ref) {
//     return dummyPlaces;
//   },
// );
class PlacesProviderNotifier extends StateNotifier<List<PlaceItem>> {
  PlacesProviderNotifier() : super([]);
  void addPlace(PlaceItem place) {
    state = [...state, place];
  }
}

final placesProvider =
    StateNotifierProvider<PlacesProviderNotifier, List<PlaceItem>>(
  (ref) => PlacesProviderNotifier(),
);
