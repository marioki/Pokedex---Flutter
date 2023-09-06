part of 'pokemon_details_bloc.dart';

enum PokemonDetailsStatus { initial, loading, loaded, error }

class PokemonDetailsState extends Equatable {
  final PokemonDetailsStatus pokemonDetailsStatus;
  final PokemonData? pokemonDetails;
  const PokemonDetailsState({
    required this.pokemonDetailsStatus,
    this.pokemonDetails,
  });

  @override
  List<Object?> get props => [pokemonDetailsStatus, pokemonDetails];
}
