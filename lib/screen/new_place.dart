import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _formKey = GlobalKey<FormState>();

  var _placeName = '';

  void _savePlace() {
    // add place
    _formKey.currentState!.save();
    ref.read(placesProvider.notifier).addPlace(
          PlaceItem(DateTime.now().toString(), _placeName),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        // add button and text field

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Place Name',
                ),
                style: TextStyle(
                  // add theme color
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                maxLength: 50,
                validator: (value) {
                  return null;
                },
                onSaved: (value) {
                  _placeName = value!;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: _savePlace,
                child: Text(
                  'Add Place',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
