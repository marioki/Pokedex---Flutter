import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PokeApiClient {
  final logger = Logger();
  http.Client _client = http.Client();
  Uri pokeApiUri = Uri(
    scheme: 'https',
    host: 'pokeapi.co',
  );

  Future<http.Response> getPokemonList() async {
    try {
      final uri = Uri(
        scheme: pokeApiUri.scheme,
        host: pokeApiUri.host,
        path: '/api/v2/pokemon',
        query: 'limit=10&offset=0',
      );
      final response = await _client.get(uri);
      return response;
    } catch (error, stackTrace) {
      logger.e(error);
      logger.e(stackTrace);
      rethrow;
    }
  }

  Future<http.Response> getPokemonDataFromUnicUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await _client.get(uri);
      return response;
    } catch (error, stackTrace) {
      logger.e(error);
      logger.e(stackTrace);
      rethrow;
    }
  }
}
