part of 'pokemon_list_bloc.dart';

@immutable
sealed class PokemonListEvent {}

class GetPokemonListEvent extends PokemonListEvent {
  GetPokemonListEvent();

  @override
  List<Object> get props => [];
}
