import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_data_response.dart';

import '../../repositories/pokemon_repository.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonRepository _pokemonRepository = PokemonRepository();

  PokemonDetailsBloc()
      : super(PokemonDetailsState(pokemonDetailsStatus: PokemonDetailsStatus.initial)) {
    on<GetPokemonDetailsEvent>(_onGetPokemonDetailsEvent);
  }

  Future<FutureOr<void>> _onGetPokemonDetailsEvent(
      GetPokemonDetailsEvent event, Emitter<PokemonDetailsState> emit) async {
    emit(PokemonDetailsState(pokemonDetailsStatus: PokemonDetailsStatus.loading));
    PokemonData pokemonDetails = await _pokemonRepository.getPokemonDataFromId(event.pokemonId);
    emit(PokemonDetailsState(
        pokemonDetailsStatus: PokemonDetailsStatus.loaded, pokemonDetails: pokemonDetails));
  }
}
