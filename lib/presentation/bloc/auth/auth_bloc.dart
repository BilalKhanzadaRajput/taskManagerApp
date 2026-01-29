import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/check_auth_status_usecase.dart';
import '../../utils/error_message_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
    required CheckAuthStatusUseCase checkAuthStatusUseCase,
  }) : _loginUseCase = loginUseCase,
       _logoutUseCase = logoutUseCase,
       _checkAuthStatusUseCase = checkAuthStatusUseCase,
       super(const AuthState()) {
    on<_OnLogin>(_onLogin);
    on<_OnLogout>(_onLogout);
    on<_OnCheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(_OnLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final user = await _loginUseCase(event.username, event.password);

      emit(
        state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          user: user,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isAuthenticated: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onLogout(_OnLogout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await _logoutUseCase();
      emit(
        const AuthState(
          isLoading: false,
          isAuthenticated: false,
          user: null,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onCheckAuthStatus(
    _OnCheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final isLoggedIn = await _checkAuthStatusUseCase();
    emit(state.copyWith(isAuthenticated: isLoggedIn));
  }
}
