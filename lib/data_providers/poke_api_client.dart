import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PokeApiClient {
  final logger = Logger();
  http.Client client = http.Client();
  Uri pokeApiUri = Uri(scheme: 'https', host: 'pokeapi.co', path: '/api/v2/');

  Future<http.Response> getPokemonList() async {
    try {
      final response = await client.get(pokeApiUri);
      final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      logger.d(decodedResponse);
      return response;
    } finally {
      client.close();
    }
  }
}
