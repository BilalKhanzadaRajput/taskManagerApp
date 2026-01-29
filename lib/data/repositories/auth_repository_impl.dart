import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../mappers/user_mapper.dart';
import '../models/auth_request_model.dart';
import '../models/user_model.dart';
import '../network/dio_client.dart';
import '../datasources/local/secure_storage_datasource.dart';

/// Data layer implementation of AuthRepository
/// Implements the domain repository interface
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final _apiClient = DioClient.getApiClient();
  final SecureStorageDataSource _secureStorage;

  AuthRepositoryImpl(this._secureStorage);

  @override
  Future<UserEntity> login(String username, String password) async {
    try {
      final request = AuthRequestModel(username: username, password: password);
      final userModel = await _apiClient.login(request);

      // Save auth data securely
      await _secureStorage.saveToken(userModel.token);
      await _secureStorage.saveUserId(userModel.id.toString());
      await _secureStorage.saveUsername(userModel.username);

      return UserMapper.toEntity(userModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _secureStorage.clearAll();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String?> getCurrentUserId() async {
    return await _secureStorage.getUserId();
  }
}
