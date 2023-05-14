import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

// class PlaceDetails extends ConsumerWidget {
//   const PlaceDetails({super.key, required this.placeIndex});
//   final int placeIndex;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final placeDetail = ref.watch(userPlacesProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Place Details'),
//       ),
//       body: Center(
//         child: Text(
//           placeDetail[placeIndex].title,
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.onBackground,
//           ),
//         ),
//       ),
//     );
//   }
// }

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Details'),
      ),
      body: Center(
        child: Text(
          place.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
