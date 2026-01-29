import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/theme/theme_cubit.dart';
import 'presentation/utils/app_theme.dart';
import 'presentation/router/app_router.dart';
import 'presentation/factories/usecase_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  // Note: Run 'flutter pub run build_runner build' to generate injection.config.dart
  // configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc(
      loginUseCase: UseCaseFactory.createLoginUseCase(),
      logoutUseCase: UseCaseFactory.createLogoutUseCase(),
      checkAuthStatusUseCase: UseCaseFactory.createCheckAuthStatusUseCase(),
    )..add(const AuthEvent.onCheckAuthStatus());
    final themeCubit = ThemeCubit();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        BlocProvider.value(value: themeCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                title: 'Task Manager',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode,
                routerConfig: AppRouter.createRouter(authBloc),
              );
            },
          );
        },
      ),
    );
  }
}
