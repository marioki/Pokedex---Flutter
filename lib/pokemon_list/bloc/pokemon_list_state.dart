part of 'pokemon_list_bloc.dart';

enum PokemonListStatus { initial, loading, loaded, error }

final class PokemonListState extends Equatable {
  final List<PokemonData> pokemonDataList;
  final PokemonListStatus pokemonListStatus;
  PokemonListState({required this.pokemonListStatus, this.pokemonDataList = const []});

  @override
  List<Object?> get props => [pokemonDataList, pokemonListStatus];
}
