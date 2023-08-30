import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/pokemon_data_response.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import '../../logger.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository _pokemonRepository = PokemonRepository();
  PokemonListBloc() : super(PokemonListState(pokemonListStatus: PokemonListStatus.initial)) {
    on<GetPokemonListEvent>(_OnGetPokemonListEvent);
  }

  Future<FutureOr<void>> _OnGetPokemonListEvent(
      GetPokemonListEvent event, Emitter<PokemonListState> emit) async {
    logger.d('Get Pokemon Event triggered');
    emit(PokemonListState(
      pokemonDataList: state.pokemonDataList,
      pokemonListStatus: PokemonListStatus.loading,
    ));
    try {
      List<PokemonData> newPokemonDataList =
          await _pokemonRepository.getPokemonList(event.limit, event.offset);
      emit(PokemonListState(
        pokemonListStatus: PokemonListStatus.loaded,
        pokemonDataList: state.pokemonDataList + newPokemonDataList,
      ));
    } catch (error, stackTrace) {
      logger.e(error);
      logger.e(stackTrace);
      emit(PokemonListState(pokemonListStatus: PokemonListStatus.error));
    }
  }

  // @override
  // PokemonListState? fromJson(Map<String, dynamic> json) {
  //   return PokemonListState.fromJson(json);
  // }

  // @override
  // Map<String, dynamic>? toJson(PokemonListState state) {
  //   return state.toJson();
  // }
}
