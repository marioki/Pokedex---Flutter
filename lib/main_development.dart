import 'package:logger/logger.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/bootstrap.dart';

void main() {
  final logger = Logger();

  bootstrap(() => const App());
}
