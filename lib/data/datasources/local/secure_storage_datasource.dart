import 'package:injectable/injectable.dart';
import '../../utils/secure_storage_helper.dart';

/// Data source for secure storage operations
@Injectable()
class SecureStorageDataSource {
  Future<void> saveToken(String token) async {
    await SecureStorageHelper.saveToken(token);
  }

  Future<String?> getToken() async {
    return await SecureStorageHelper.getToken();
  }

  Future<void> saveUserId(String userId) async {
    await SecureStorageHelper.saveUserId(userId);
  }

  Future<String?> getUserId() async {
    return await SecureStorageHelper.getUserId();
  }

  Future<void> saveUsername(String username) async {
    await SecureStorageHelper.saveUsername(username);
  }

  Future<String?> getUsername() async {
    return await SecureStorageHelper.getUsername();
  }

  Future<void> clearAll() async {
    await SecureStorageHelper.clearAll();
  }
}
