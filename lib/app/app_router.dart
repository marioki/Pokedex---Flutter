import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pokemon_list/view/pokemon_list_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => PokemonListBloc()..add(GetPokemonListEvent()),
        lazy: false,
        child: PokemonListPage(),
      ),
    ),
  ],
);
