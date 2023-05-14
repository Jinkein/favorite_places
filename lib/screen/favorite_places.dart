import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/screen/new_place.dart';
import 'package:favorite_places/screen/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() =>
      _FavoritePlacesScreenState();
}

class _FavoritePlacesScreenState extends ConsumerState<FavoritePlacesScreen> {
  void _newPlace() {
    Navigator.of(context).push<PlaceItem>(
      MaterialPageRoute(
        builder: (context) => const NewPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // render list of places
    final places = ref.watch(placesProvider);
    var content = ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // add navigation to place details
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaceDetails(placeIndex: index),
              ),
            );
          },
          child: ListTile(
            title: Text(
              places[index].title,
              // add theme color for text
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: _newPlace,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
          // Handle empty places
          child: content),
    );
  }
}
