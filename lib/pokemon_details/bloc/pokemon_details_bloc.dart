import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_data_response.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc()
      : super(PokemonDetailsState(pokemonDetailsStatus: PokemonDetailsStatus.initial)) {
    on<GetPokemonDetailsEvent>(_onGetPokemonDetailsEvent);
  }

  FutureOr<void> _onGetPokemonDetailsEvent(
      GetPokemonDetailsEvent event, Emitter<PokemonDetailsState> emit) {}
}
