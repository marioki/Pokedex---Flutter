part of 'pokemon_list_bloc.dart';

enum PokemonListStatus { initial, loading, loaded, error }

class PokemonListState extends Equatable {
  final List<PokemonData> pokemonDataList;
  final PokemonListStatus pokemonListStatus;

  PokemonListState({
    required this.pokemonListStatus,
    this.pokemonDataList = const [],
  });

  @override
  List<Object?> get props => [pokemonDataList, pokemonListStatus];

  // Convert JSON to PokemonListState
  factory PokemonListState.fromJson(Map<String, dynamic> json) {
    return PokemonListState(
      pokemonListStatus: _statusFromString(json['pokemonListStatus']),
      pokemonDataList:
          (json['pokemonDataList'] as List).map((data) => PokemonData.fromJson(data)).toList(),
    );
  }

  // Convert PokemonListState to JSON
  Map<String, dynamic> toJson() {
    return {
      'pokemonListStatus': pokemonListStatus.toString().split('.').last, // convert enum to string
      'pokemonDataList': pokemonDataList.map((data) => data.toJson()).toList(),
    };
  }
}

PokemonListStatus _statusFromString(String status) {
  switch (status) {
    case 'loading':
      return PokemonListStatus.loading;
    case 'loaded':
      return PokemonListStatus.loaded;
    case 'error':
      return PokemonListStatus.error;
    case 'initial':
    default:
      return PokemonListStatus.initial;
  }
}
