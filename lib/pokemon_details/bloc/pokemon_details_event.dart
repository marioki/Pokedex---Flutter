part of 'pokemon_details_bloc.dart';

sealed class PokemonDetailsEvent extends Equatable {
  const PokemonDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonDetailsEvent extends PokemonDetailsEvent {
  final int pokemonId;
  const GetPokemonDetailsEvent({required this.pokemonId});

  @override
  List<Object> get props => [pokemonId];
}
