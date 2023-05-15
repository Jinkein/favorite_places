import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/screen/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class PlacesListScreen extends ConsumerStatefulWidget {
//   const PlacesListScreen({super.key});

//   @override
//   ConsumerState<PlacesListScreen> createState() => _FavoritePlacesScreenState();
// }

// class _FavoritePlacesScreenState extends ConsumerState<PlacesListScreen> {
//   void _newPlace() {
//     Navigator.of(context).push<Place>(
//       MaterialPageRoute(
//         builder: (context) => const NewPlaceScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // render list of places
//     final places = ref.watch(placesProvider);
//     var content = ListView.builder(
//       itemCount: places.length,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             // add navigation to place details
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => PlaceDetails(placeIndex: index),
//               ),
//             );
//           },
//           child: ListTile(
//             title: Text(
//               places[index].title,
//               // add theme color for text
//               style:
//                   TextStyle(color: Theme.of(context).colorScheme.onBackground),
//             ),
//           ),
//         );
//       },
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Places'),
//         actions: [
//           IconButton(
//             onPressed: _newPlace,
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: Center(
//           // Handle empty places
//           child: content),
//     );
//   }
// }
class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const AddPlaceScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(
          places: userPlaces,
        ),
      ),
    );
  }
}
