import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/pokemon_data_response.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import '../../logger.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository _pokemonRepository = PokemonRepository();
  PokemonListBloc() : super(PokemonListState(PokemonListStatus: PokemonListStatus.initial)) {
    on<GetPokemonListEvent>(_OnGetPokemonListEvent);
  }

  Future<FutureOr<void>> _OnGetPokemonListEvent(
      GetPokemonListEvent event, Emitter<PokemonListState> emit) async {
    logger.d('Get Pokemon Event triggered');
    emit(PokemonListState(PokemonListStatus: PokemonListStatus.loading));
    try {
      List<PokemonData> pokemonDataList = await _pokemonRepository.getPokemonList();
      emit(PokemonListState(
        PokemonListStatus: PokemonListStatus.loaded,
        pokemonDataList: pokemonDataList,
      ));
    } catch (error, stackTrace) {
      logger.e(error);
      logger.e(stackTrace);
      emit(PokemonListState(PokemonListStatus: PokemonListStatus.error));
    }
  }
}
