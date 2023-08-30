part of 'pokemon_list_bloc.dart';

@immutable
sealed class PokemonListEvent {
  List<Object> get props => [];
}

class GetPokemonListEvent extends PokemonListEvent {
  final int limit;
  final int offset;
  GetPokemonListEvent(this.limit, this.offset);

  @override
  List<Object> get props => [limit, offset];
}
