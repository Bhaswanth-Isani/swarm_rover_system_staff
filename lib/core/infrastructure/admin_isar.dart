import 'package:isar/isar.dart';
import 'package:swarm_rover_system_staff/core/infrastructure/helpers/fast_hash_function.dart';

part 'admin_isar.g.dart';

@collection
class AdminIsar {
  late String id;

  Id get isarId => fastHash(id);

  @Index(unique: true)
  late String username;

  late String token;
}
