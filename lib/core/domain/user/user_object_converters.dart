import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_staff/core/domain/user/user_objects.dart';

/// A JSON converter for Password value object. Using toJson when the input is
/// a failure will result in an app crash.
class PasswordConverter implements JsonConverter<Password, String> {
  const PasswordConverter();

  @override
  Password fromJson(String input) {
    return Password(input);
  }

  @override
  String toJson(Password password) {
    return password.getOrCrash();
  }
}

/// A JSON converter for Username value object. Using toJson when the input is a
/// failure will result in an app crash.
class UsernameConverter implements JsonConverter<Username, String> {
  const UsernameConverter();

  @override
  Username fromJson(String input) {
    return Username(input);
  }

  @override
  String toJson(Username username) {
    return username.getOrCrash();
  }
}
