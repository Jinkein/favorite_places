import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetails extends ConsumerWidget {
  const PlaceDetails({super.key, required this.placeIndex});
  final int placeIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeDetail = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Details'),
      ),
      body: Center(
        child: Text(
          placeDetail[placeIndex].title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
