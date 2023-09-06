import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc() : super(PokemonDetailsInitial()) {
    on<GetPokemonDetailsEvent>(_onGetPokemonDetailsEvent);
  }

  FutureOr<void> _onGetPokemonDetailsEvent(
      GetPokemonDetailsEvent event, Emitter<PokemonDetailsState> emit) {}
}
