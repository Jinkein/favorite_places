import 'dart:io';

import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AddPlaceScreen extends ConsumerStatefulWidget {
//   const AddPlaceScreen({super.key});

//   @override
//   ConsumerState<AddPlaceScreen> createState() => _NewPlaceScreenState();
// }

// class _NewPlaceScreenState extends ConsumerState<AddPlaceScreen> {
//   final _formKey = GlobalKey<FormState>();

//   var _placeName = '';

//   void _savePlace() {
//     // add place
//     _formKey.currentState!.save();
//     ref.read(placesProvider.notifier).addPlace(
//           Place(title: _placeName),
//         );
//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add New Place'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         // add button and text field

//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Place Name',
//                 ),
//                 style: TextStyle(
//                   // add theme color
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 maxLength: 50,
//                 validator: (value) {
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _placeName = value!;
//                 },
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               ElevatedButton(
//                 onPressed: _savePlace,
//                 child: Text(
//                   'Add Place',
//                   style: TextStyle(
//                       color: Theme.of(context).colorScheme.onBackground),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            // image input
            const SizedBox(
              height: 18,
            ),
            ImageInput(
              onPickImage: (File image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton.icon(
              label: const Text('Add place'),
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
