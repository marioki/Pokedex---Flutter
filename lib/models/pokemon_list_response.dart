// To parse this JSON data, do
//
//     final pokemonList = pokemonListFromJson(jsonString);

import 'dart:convert';

PokemonList pokemonListFromJson(String str) => PokemonList.fromJson(json.decode(str));

String pokemonListToJson(PokemonList data) => json.encode(data.toJson());

class PokemonList {
  PokemonList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Pokemon>.from(json["results"]!.map((x) => Pokemon.fromJson(x))),
      );
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Pokemon>? results;

  PokemonList copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<Pokemon>? results,
  }) =>
      PokemonList(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    this.name,
    this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );
  final String? name;
  final String? url;

  Pokemon copyWith({
    String? name,
    String? url,
  }) =>
      Pokemon(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
