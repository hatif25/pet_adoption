import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/screens/InteractiveViewerScreen.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onTap;

  PetCard({required this.pet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        onTap: onTap,
        leading: InkWell(
          onTap: () {
            if (!pet.adopted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InteractiveViewerScreen(pet: pet),
                ),
              );
            }
          },
          child: Hero(
            tag: 'pet-${pet.name}',
            child: CircleAvatar(
              backgroundImage: AssetImage(pet.image),
            ),
          ),
        ),
        title: Text(pet.name),
        subtitle: pet.adopted ? Text('Already Adopted') : null,
      ),
    );
  }
}
