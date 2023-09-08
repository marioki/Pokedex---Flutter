import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_data_response.dart';
import 'package:pokedex/pokemon_details/bloc/pokemon_details_bloc.dart';
import 'package:pokedex/pokemon_list/view/pokemon_list_item_widget.dart';
import 'package:pokedex/pokemon_list/view/pokemon_type_chip_list.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int? pokemonId;
  const PokemonDetailsPage({required this.pokemonId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (context, state) {
            if (state.pokemonDetailsStatus == PokemonDetailsStatus.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.pokemonDetailsStatus == PokemonDetailsStatus.initial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.pokemonDetailsStatus == PokemonDetailsStatus.loaded) {
              PokemonData pokemonData = state.pokemonDetails!;
              return Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 350,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 166, 232, 255),
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                          ]),
                      child: Image.network(
                        state.pokemonDetails!.sprites!.frontDefault!,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    PokemonTypeChipList(
                      types: pokemonData.pokemonTypes,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Weight'),
                            Text('9 Kilog.'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Weight'),
                            Text('9 Kilog.'),
                          ],
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 166, 232, 255),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 4),
                        ),
                        hintText: 'Your Hint Text',
                        contentPadding: EdgeInsets.all(16), // Adjust this for internal padding
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 166, 232, 255), // button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(color: Colors.black, width: 4), // border width and color
                        ),
                        elevation: 4, // elevation
                        shadowColor: Colors.black, // shadow color
                      ),
                      child: Text('Your Button Text'),
                    )
                  ],
                ),
              );
            }
            return Center(
              child: Text('Invalid State'),
            );
          },
        ),
      ),
    );
  }
}
