// logger.dart file
import 'package:logger/logger.dart';

Logger logger = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);
