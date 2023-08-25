import 'package:go_router/go_router.dart';
import 'package:pokedex/counter/counter.dart';
import 'package:pokedex/pokemon_list/view/pokemon_list_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PokemonListPage(),
    ),
  ],
);
