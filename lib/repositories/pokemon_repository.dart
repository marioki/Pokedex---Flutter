import 'package:pokedex/data_providers/poke_api_client.dart';
import 'package:pokedex/logger.dart';
import 'package:pokedex/models/pokemon_data_response.dart';
import '../models/pokemon_list_response.dart';

class PokemonRepository {
  final PokeApiClient _pokeApiClient = PokeApiClient();

  Future<List<PokemonData>> getPokemonList(int limit, int offset) async {
    List<PokemonData> pokemonDataList = [];
    var response = await _pokeApiClient.getPokemonList(limit, offset);
    final pokemonList = pokemonListFromJson(response.body);

    for (var element in pokemonList.results!) {
      //logger.d('Current Pokemon: ${element.name} has url: ${element.url}');
      var response = await _pokeApiClient.getPokemonDataFromUnicUrl(element.url!);
      final pokemonData = pokemonDataFromJson(response.body);
      pokemonDataList.add(pokemonData);
    }
    return pokemonDataList;
  }

  Future<PokemonData> getPokemonDataFromId(int id) async {
    //logger.d('Current Pokemon: ${element.name} has url: ${element.url}');
    var response = await _pokeApiClient.getPokemonDataFromId(id);
    final pokemonData = pokemonDataFromJson(response.body);
    return pokemonData;
  }
}
