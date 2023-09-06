import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/logger.dart';
import 'package:pokedex/pokemon_details/view/pokemon_detail_page.dart';
import 'package:pokedex/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pokemon_list/view/pokemon_list_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          logger.d('Router navigator builder triggerd');
          return BlocProvider(
            create: (context) => PokemonListBloc(),
            lazy: false,
            child: PokemonListPage(),
          );
        },
        routes: [
          GoRoute(
            path: 'pokemon/id:',
            builder: (context, state) {
              int? pokemonId = int.tryParse(state.pathParameters["id"] ?? '');
              return PokemonDetailsPage(pokemonId: pokemonId);
            },
          ),
        ]),
  ],
);
