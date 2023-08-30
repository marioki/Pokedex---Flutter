import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
