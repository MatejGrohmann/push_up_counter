part of 'app.dart';

late GetIt getIt;

class AppInjections {
  static void inject([GetIt? mock]) {
    getIt = mock ?? GetIt.instance;
    if (mock != null) return;
    getIt.registerFactory<ThemeCubit>(() => ThemeCubitImpl());
    getIt.registerFactory<SettingsCubit>(() => SettingsCubitImpl());
  }
}
