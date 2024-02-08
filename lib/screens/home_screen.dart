// home_screen.dart
import 'package:flutter/material.dart';
import 'package:pet_adoption/bloc/home_bloc.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/screens/details_screen.dart';
import 'package:pet_adoption/widgets/pet_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Pet> pets;

  HomeScreen({required this.pets});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc(widget.pets);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  // Function to handle pet adoption
  void _handlePetAdoption(Pet pet) {
    setState(() {
      // Find the adopted pet in the list and update its adoption status
      for (var i = 0; i < widget.pets.length; i++) {
        if (widget.pets[i].name == pet.name) {
          widget.pets[i].adopted = true;
          widget.pets[i].adoptionDate = DateTime.now();
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (searchText) {
                _bloc.searchTextSink.add(searchText);
              },
              decoration: InputDecoration(
                labelText: 'Search Pets',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _bloc.searchTextSink.add('');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Pet>>(
              stream: _bloc.filteredPets,
              initialData: widget.pets,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final pet = snapshot.data![index];
                    return PetCard(
                      pet: pet,
                      onTap: () async {
                        // Navigate to details page on pet selection
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              pet: pet,
                              onAdopted: () => _handlePetAdoption(pet),
                            ),
                          ),
                        );
                        if (result != null && result) {
                          setState(() {
                            // Update the list of pets if adoption occurred
                            pet.adopted = true;
                            pet.adoptionDate = DateTime.now();
                          });
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
