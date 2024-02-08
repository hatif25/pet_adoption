import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';

class HistoryScreen extends StatelessWidget {
  final List<Pet> adoptedPets;

  HistoryScreen({required this.adoptedPets});

  @override
  Widget build(BuildContext context) {
    // Sort adopted pets by adoption date in descending order
    adoptedPets.sort((a, b) => b.adoptionDate!.compareTo(a.adoptionDate!));

    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption History'),
          centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: _buildAdoptionHistoryList(),
    );
  }

  Widget _buildAdoptionHistoryList() {
    if (adoptedPets.isEmpty) {
      return Center(
        child: Text('No pets have been adopted yet.'),
      );
    }

    return ListView.builder(
      itemCount: adoptedPets.length,
      itemBuilder: (context, index) {
        final pet = adoptedPets[index];
        return ListTile(
          title: Text(pet.name),
          subtitle: Text('Adopted on: ${_formatDate(pet.adoptionDate!)}'),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
