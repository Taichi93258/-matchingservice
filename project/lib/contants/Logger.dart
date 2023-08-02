import 'package:logger/logger.dart';

final logger = Logger();

void errorLog(String str) {
  logger.e(str);
}

void infoLog(String str) {
  logger.i(str);
}

void debugLog(String str) {
  logger.d(str);
}
