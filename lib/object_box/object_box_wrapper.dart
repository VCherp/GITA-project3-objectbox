import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'objectbox.g.dart';

import '../models/profile.dart';

class ObjectBoxWrapper {
  static ObjectBoxWrapper? _instance;

  late final Store _store;

  late final Box<Profile> _profileBox;

  ObjectBoxWrapper._create(this._store) {
    _profileBox = Box<Profile>(_store);
  }

  static Future<ObjectBoxWrapper> getInstance() async {
    if (_instance == null) {
      final dir = await getApplicationDocumentsDirectory();
      final store = await openStore(
        directory: join(dir.path, 'object_box'),
        macosApplicationGroup: 'objectbox.demo',
      );
      _instance = ObjectBoxWrapper._create(store);
    }
    return _instance!;
  }

  Future<void> addProfile(Profile profile) => _profileBox.putAsync(profile);

  Future<void> removeProfile(int id) => _profileBox.removeAsync(id);

  Profile? getProfileByPhone(String phoneNumber) {
    final query = _profileBox.query(Profile_.phone.equals(phoneNumber)).build();
    return query.findFirst();
  }
}
