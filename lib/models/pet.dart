import 'package:flutter/material.dart';

class Pet {
  final String name;
  final int age; // Age in years
  final double price;
  final String image;
  bool adopted;
  DateTime? adoptionDate;

  Pet({
    required this.name,
    required this.age,
    required this.price,
    required this.image,
    this.adopted = false,
    this.adoptionDate,
  });

  // Calculate the age in months
  int ageInMonths() {
    return age * 12;
  }
}

