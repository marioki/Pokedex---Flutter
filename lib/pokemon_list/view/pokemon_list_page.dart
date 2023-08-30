import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/logger.dart';
import 'package:pokedex/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pokemon_list/view/pokemon_list_item_widget.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../../models/pokemon_data_response.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PokemonListBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: InfiniteList(
        padding: EdgeInsets.all(16),
        itemCount: state.pokemonDataList.length,
        hasError: false,
        isLoading: state.pokemonListStatus == PokemonListStatus.loading,
        loadingBuilder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        itemBuilder: (context, index) {
          PokemonData pokemonItem = state.pokemonDataList[index];
          return PokemonListItemWidget(
            pokemon: pokemonItem,
          );
        },
        onFetchData: () {
          logger.d('On fetch data called');
          context
              .read<PokemonListBloc>()
              .add(GetPokemonListEvent(10, state.pokemonDataList.length));
        },
      ),
    );
  }
}
