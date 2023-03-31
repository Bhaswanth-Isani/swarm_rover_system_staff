import 'package:dartz/dartz.dart';
import 'package:swarm_rover_system_staff/core/domain/value_failure.dart';
import 'package:swarm_rover_system_staff/type_defs.dart';

/// Returns right String if the input string length is grater than the input
/// min else returns left CoreFailure.
EitherFailure<String> validateMinLengthString(
  String input,
  int min,
) {
  return input.length >= min
      ? right(input)
      : left(CoreFailure.shortString(failedValue: input));
}
