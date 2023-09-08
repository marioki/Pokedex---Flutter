// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pokedex/models/pokemon_data_response.dart';
import 'package:pokedex/pokemon_list/view/pokemon_type_chip_list.dart';

class PokemonListItemWidget extends StatelessWidget {
  final PokemonData pokemon;
  const PokemonListItemWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/pokemon/${pokemon.id}');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('#${pokemon.id.toString()}'),
          Image(
            width: 100,
            height: 100,
            fit: BoxFit.contain,
            image: NetworkImage(
              pokemon.sprites!.frontDefault!,
            ),
          ),
          Text(pokemon.name!),
          Spacer(),
          PokemonTypeChipList(types: pokemon.pokemonTypes)
        ],
      ),
    );
  }
}
