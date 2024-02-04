import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/state/theme_state.dart';
import '../utils/storage_util.dart';

abstract class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const InitialThemeState());

  Future<void> fetchTheme();

  void setTheme({required ThemeMode themeMode});

  Future<void> storeTheme();

  Future<void> resetTheme();
}

class ThemeCubitImpl extends ThemeCubit with StorageUtil {
  static String get themeModeKey => 'themeModeKey';

  ThemeCubitImpl() {
    fetchTheme();
  }

  @override
  Future<void> fetchTheme() {
    return fetchData(key: themeModeKey).then(
      (jsonData) {
        final themeMode = retrieveData(jsonData: jsonData);
        emit(InitialThemeState(themeMode));
      },
    );
  }

  @override
  void setTheme({required ThemeMode themeMode}) {
    emit(
      UnsavedThemeState(
        themeMode: themeMode,
      ),
    );
  }

  @override
  Future<void> storeTheme() async {
    emit(LoadingThemeState(themeMode: state.themeMode));
    final themeMode = state.themeMode;
    return storeData(
      key: themeModeKey,
      data: convertData(data: themeMode),
    ).then(
      (value) {
        emit(SavedThemeState(themeMode: themeMode));
      },
    );
  }

  @override
  Future<void> resetTheme() async {
    return removeData(key: themeModeKey).then((value) {
      emit(const RestoredThemeState());
    });
  }

  @override
  Map<String, dynamic>? convertData({required data}) {
    if (data is! ThemeMode) {
      return null;
    }
    final index = data.index;
    return {
      themeModeKey: index,
    };
  }

  @override
  ThemeMode? retrieveData({required Map<String, dynamic>? jsonData}) {
    if (jsonData == null) {
      return null;
    }
    if (jsonData.containsKey(themeModeKey)) {
      final index = jsonData[themeModeKey];
      if (index is! int) return null;
      return ThemeMode.values[jsonData[themeModeKey]];
    }
    return null;
  }
}
