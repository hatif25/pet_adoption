import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';

class InteractiveViewerScreen extends StatelessWidget {
  final Pet pet;

  InteractiveViewerScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Image'),
                centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.1,
          maxScale: 4,
          child: Hero(
            tag: 'pet-${pet.name}',
            child: Image.asset(pet.image),
          ),
        ),
      ),
    );
  }
}
