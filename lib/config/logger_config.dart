import 'package:logger/logger.dart';

//
final appLog = Logger(
  // level : Level.info,
  printer: PrettyPrinter(),
);

final appLogNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0 , ),
);
