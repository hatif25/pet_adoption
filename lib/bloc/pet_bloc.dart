import 'dart:async';
import 'package:pet_adoption/models/pet.dart';

class PetBloc {
  final _petsController = StreamController<List<Pet>>();
  Stream<List<Pet>> get petsStream => _petsController.stream;

  List<Pet> _pets = [];
  List<Pet> get pets => _pets;

  void loadPets(List<Pet> pets) {
    _pets = pets;
    _petsController.sink.add(pets);
  }

  void dispose() {
    _petsController.close();
  }
}
