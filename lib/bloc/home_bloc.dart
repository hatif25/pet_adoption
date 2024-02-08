import 'dart:async';

import 'package:pet_adoption/models/pet.dart';

class HomeBloc {
  final _filteredPetsController = StreamController<List<Pet>>.broadcast();
  final _searchTextController = StreamController<String>.broadcast();
  final _minAgeController = StreamController<int?>.broadcast();
  final _maxAgeController = StreamController<int?>.broadcast();
  final _minPriceController = StreamController<double?>.broadcast();
  final _maxPriceController = StreamController<double?>.broadcast();

  Stream<List<Pet>> get filteredPets => _filteredPetsController.stream;
  StreamSink<String> get searchTextSink => _searchTextController.sink;
  StreamSink<int?> get minAgeSink => _minAgeController.sink;
  StreamSink<int?> get maxAgeSink => _maxAgeController.sink;
  StreamSink<double?> get minPriceSink => _minPriceController.sink;
  StreamSink<double?> get maxPriceSink => _maxPriceController.sink;



HomeBloc(List<Pet> initialPets) {
  _searchTextController.stream.listen((searchText) {
    // Filter pets based on the search text
    List<Pet> filteredPets = initialPets.where((pet) =>
      pet.name.toLowerCase().contains(searchText.toLowerCase())
    ).toList();

    // Update filteredPets stream with filtered list
    _filteredPetsController.sink.add(filteredPets);
  });

  // Similar listeners for other filter criteria
}

  void dispose() {
    _filteredPetsController.close();
    _searchTextController.close();
    _minAgeController.close();
    _maxAgeController.close();
    _minPriceController.close();
    _maxPriceController.close();
  }
}
