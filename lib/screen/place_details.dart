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
  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyBTBV_yjGwUEYOddgvl3gti9-XTQmKIeXQ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Place Details'),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(locationImage),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        place.location.address,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
