import 'package:get_it/get_it.dart';
// After running build_runner, add: import 'package:injectable/injectable.dart';
// After running build_runner, add: import 'injection.config.dart';

final getIt = GetIt.instance;

/// Configure dependency injection
///
/// After running: flutter pub run build_runner build --delete-conflicting-outputs
/// This function will be automatically updated to call getIt.init()
///
/// The generated code will look like:
/// @InjectableInit()
/// Future<void> configureDependencies() => getIt.init();
Future<void> configureDependencies() async {
  // This is a placeholder. After running build_runner, this will be replaced
  // with the generated initialization code.
}
