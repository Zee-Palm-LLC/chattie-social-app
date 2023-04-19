import 'package:chatie/app/data/keys/local_storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class FirstLaunchService {
  final storage = GetStorage();
  Future<bool> checkFirstLaunch() async {
    if (storage.read<bool>(LocalStorageKeys.firstLaunch) != null) {
      return false;
    }
    await storage.write(LocalStorageKeys.firstLaunch, false);
    return true;
  }
}
