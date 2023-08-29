import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_data_response.dart';

class TypeChipWidget extends StatelessWidget {
  final PokemonType pokemonType;
  const TypeChipWidget({
    super.key,
    required this.pokemonType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Chip(label: Text(pokemonType.species!.name!)),
    );
  }
}
