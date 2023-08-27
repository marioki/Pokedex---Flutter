import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/logger.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/pokemon_list/bloc/pokemon_list_bloc.dart';

import '../../models/pokemon_data_response.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        actions: [
          IconButton(
            onPressed: () => context.read<PokemonListBloc>().add(GetPokemonListEvent()),
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          logger.d('Current State on builder: ${state.PokemonListStatus}');
          if (state.PokemonListStatus == PokemonListStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.PokemonListStatus == PokemonListStatus.loaded) {
            return ListView.builder(
              itemCount: state.pokemonDataList!.length,
              itemBuilder: (context, index) {
                PokemonData pokemonItem = state.pokemonDataList![index];
                return ListTile(
                  leading: Image.network(
                    pokemonItem.sprites!.frontDefault!,
                    fit: BoxFit.cover,
                  ),
                  title: Text(pokemonItem.name!),
                );
              },
            );
          }
          if (state.PokemonListStatus == PokemonListStatus.error) {
            return Center(child: Text('Error loading data'));
          }
          return Center(
            child: Text('Initial State'),
          );
        },
      ),
    );
  }
}
