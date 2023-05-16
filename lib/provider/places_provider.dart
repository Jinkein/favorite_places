import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesProviderNotifier extends StateNotifier<List<Place>> {
  PlacesProviderNotifier() : super(const []);
  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [...state, newPlace];
  }
}

final userPlacesProvider =
    StateNotifierProvider<PlacesProviderNotifier, List<Place>>(
  (ref) => PlacesProviderNotifier(),
);
