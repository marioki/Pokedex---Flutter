import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/view/app.dart';
import 'package:pokedex/pokemon_details/bloc/pokemon_details_bloc.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int? pokemonId;
  const PokemonDetailsPage({required this.pokemonId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
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
            return Text(state.pokemonDetails!.name!);
          }
          return Center(
            child: Text('Invalid State'),
          );
        },
      ),
    );
  }
}
