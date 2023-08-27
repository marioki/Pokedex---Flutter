import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
