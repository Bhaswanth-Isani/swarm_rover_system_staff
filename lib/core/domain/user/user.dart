import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_staff/core/domain/user/user_object_converters.dart';
import 'package:swarm_rover_system_staff/core/domain/user/user_objects.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// User class is a freezed and JSON serializable class which consists of
///   - EmailAddress email
///   - Password password
///   - Username username
///
/// Remember that calling toJson with invalid inputs will result in an app
/// crash.
class User with _$User {
  const factory User({
    @UsernameConverter() required Username hotelName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
