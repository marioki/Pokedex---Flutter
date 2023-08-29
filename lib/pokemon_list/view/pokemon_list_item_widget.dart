import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_data_response.dart';

import 'type_chip_widget.dart';

class PokemonListItemWidget extends StatelessWidget {
  final PokemonData pokemon;
  const PokemonListItemWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Row(
          children: pokemon.pokemonTypes!
              .map((e) => TypeChipWidget(
                    pokemonType: e,
                  ))
              .toList(),
        )
      ],
    );
  }
}
