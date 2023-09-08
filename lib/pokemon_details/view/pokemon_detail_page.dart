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
                    Image.network(
                      state.pokemonDetails!.sprites!.frontDefault!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
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
