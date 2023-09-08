// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_data_response.dart';
import 'package:pokedex/pokemon_list/view/type_chip_widget.dart';

class PokemonTypeChipList extends StatelessWidget {
  final List<PokemonType>? types;
  final MainAxisAlignment mainAxisAlignment;

  const PokemonTypeChipList({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: types!
          .map((e) => TypeChipWidget(
                pokemonType: e,
              ))
          .toList(),
    );
  }
}
