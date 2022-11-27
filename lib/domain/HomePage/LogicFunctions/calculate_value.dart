import 'package:store_it/config/logger_config.dart';

double calculateValue(String currentNumberString) {
  double retValue = 0;
  try {

    appLogNoStack.v("New calculated sum - $retValue");
  } catch (e) {
    appLogNoStack.e("Error - calculatedValue function , ${e.toString()}");
  }
  return retValue;
}
