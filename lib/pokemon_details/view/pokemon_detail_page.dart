import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_data_response.dart';
import 'package:pokedex/pokemon_details/bloc/pokemon_details_bloc.dart';
import 'package:pokedex/pokemon_list/view/pokemon_type_chip_list.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int? pokemonId;
  const PokemonDetailsPage({required this.pokemonId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 243),
      body: CustomPaint(
        painter: DotPainter(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text('Pokemon'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
              BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
                builder: (context, state) {
                  if (state.pokemonDetailsStatus == PokemonDetailsStatus.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.pokemonDetailsStatus == PokemonDetailsStatus.initial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.pokemonDetailsStatus == PokemonDetailsStatus.loaded) {
                    PokemonData pokemonData = state.pokemonDetails!;
                    return Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 350,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 166, 232, 255),
                                border: Border.all(color: Colors.black, width: 4),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                                ]),
                            child: CustomPaint(
                                painter: PokeballPainter(center: Offset(150, 150), size: 220),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Image(
                                    image:
                                        NetworkImage(state.pokemonDetails!.sprites!.frontDefault!),
                                    fit: BoxFit.contain,
                                  ),
                                )),
                          ),
                          PokemonTypeChipList(
                            types: pokemonData.pokemonTypes,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('Weight'),
                                  Text('9 Kilog.'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Weight'),
                                  Text('9 Kilog.'),
                                ],
                              ),
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 166, 232, 255),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black, width: 4),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.black, width: 4),
                              ),
                              hintText: 'Your Hint Text',
                              contentPadding:
                                  EdgeInsets.all(16), // Adjust this for internal padding
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // your button action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 166, 232, 255), // button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                side: BorderSide(
                                    color: Colors.black, width: 4), // border width and color
                              ),
                              elevation: 4, // elevation
                              shadowColor: Colors.black, // shadow color
                            ),
                            child: Text('Your Button Text'),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Text('Invalid State'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Color.fromARGB(255, 233, 232, 221);
    final paint2 = Paint()..color = Color.fromARGB(255, 247, 247, 235);

    // Adjust the step to increase/decrease the space between dots
    const step = 25;

    bool toggleColor = true;
    bool toggleColorSeed = true;
    for (double x = 0; x <= size.width; x += step) {
      toggleColor = toggleColorSeed;
      toggleColorSeed = !toggleColorSeed;
      for (double y = 0; y <= size.height; y += step) {
        if (toggleColor) {
          canvas.drawCircle(Offset(x, y), 2.0, paint1); // 1.0 is the radius
          toggleColor = !toggleColor;
        } else {
          canvas.drawCircle(Offset(x, y), 2.0, paint2); // 1.0 is the radius
          toggleColor = !toggleColor;
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PokeballPainter extends CustomPainter {
  final Offset center;
  final double size;

  PokeballPainter({required this.center, required this.size});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final radius = size / 2;
    final paintRed = Paint()..color = Color.fromARGB(255, 255, 79, 84);
    final paintWhite = Paint()..color = Color.fromARGB(255, 255, 255, 255);
    final paintBlack = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size, height: size), pi, pi, true, paintRed);

    canvas.drawArc(
        Rect.fromCenter(center: Offset(center.dx, center.dy + 8), width: size, height: size),
        0,
        pi,
        true,
        paintWhite);

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size, height: size), pi, pi, true, paintBlack);

    canvas.drawArc(
        Rect.fromCenter(center: Offset(center.dx, center.dy + 8), width: size, height: size),
        0,
        pi,
        true,
        paintBlack);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
