import 'package:flutter/material.dart';
import 'package:pet_adoption/screens/home_screen.dart';
import 'package:pet_adoption/screens/history_screen.dart';
import 'package:pet_adoption/models/pet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Pet> pets = [
      Pet(name: 'Tommy', age: 2, price: 100.0, image: 'assets/images/dog.png'),
      Pet(name: 'Luci', age: 1, price: 200.0, image: 'assets/images/dog1.png'),
      Pet(name: 'Bella', age: 2, price: 180.0, image: 'assets/images/dog2.png'),
      Pet(name: 'Coco', age: 4, price: 190.0, image: 'assets/images/cat.png'),
      Pet(name: 'Rosie', age: 2, price: 500.0, image: 'assets/images/dog1.png'),
      Pet(name: 'Millie', age: 1, price: 120.0, image: 'assets/images/dog2.png'),
      Pet(name: 'Tom', age: 2, price: 190.0, image: 'assets/images/cat.png'),
      Pet(name: 'Millie', age: 1, price: 120.0, image: 'assets/images/dog1.png'),
      Pet(name: 'Tom', age: 2, price: 190.0, image: 'assets/images/cat.png'),
      // Add more pets here
    ];

    return MaterialApp(
      title: 'Pet Adoption App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MainScreen(pets: pets),
    );
  }
}


class MainScreen extends StatefulWidget {
  final List<Pet> pets;

  MainScreen({required this.pets});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets,color: Colors.black,),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history,color: Colors.black,),
            label: 'History',
          ),
        ],
      ),
    );
  }

  Widget _getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen(pets: widget.pets);
      case 1:
        return HistoryScreen(
          adoptedPets: widget.pets.where((pet) => pet.adopted).toList(),
        );
      default:
        return Container();
    }
  }
}

