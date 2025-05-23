import 'package:fixnum/fixnum.dart';

dynamic convertInt64(dynamic value) {
  if (value is Int64) {
    return value.toInt();
  }
  return value;
}
