part of 'pokemon_list_bloc.dart';

enum PokemonListStatus { initial, loading, loaded, error }

final class PokemonListState {
  final List<PokemonData>? pokemonDataList;
  final PokemonListStatus;
  PokemonListState({required this.PokemonListStatus, this.pokemonDataList});
}
