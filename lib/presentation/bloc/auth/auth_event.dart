part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.onLogin({
    required String username,
    required String password,
  }) = _OnLogin;

  const factory AuthEvent.onLogout() = _OnLogout;

  const factory AuthEvent.onCheckAuthStatus() = _OnCheckAuthStatus;
}
