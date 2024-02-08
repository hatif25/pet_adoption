import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';

class DetailsScreen extends StatefulWidget {
  final Pet pet;
  final VoidCallback onAdopted;

  DetailsScreen({required this.pet, required this.onAdopted});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isAdopted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'pet-${widget.pet.name}', // Same unique tag used in HomeScreen
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(widget.pet.image),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.pet.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age: ${widget.pet.age} years',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Price: \$${widget.pet.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isAdopted
                  ? null
                  : () {
                      _showAdoptConfirmation(context);
                    },
              child: Text('Adopt Me'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAdoptConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adopt Confirmation'),
        content: Text('You\'ve now adopted ${widget.pet.name}'),
        actions: [
          TextButton(
            onPressed: () {
              widget.onAdopted();
              setState(() {
                _isAdopted = true;
              });
              Navigator.pop(context, true);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
