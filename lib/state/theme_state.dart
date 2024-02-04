import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({
    required this.themeMode,
  });

  @override
  List<Object> get props => [themeMode];
}

class InitialThemeState extends ThemeState {
  const InitialThemeState([ThemeMode? themeMode])
      : super(
          themeMode: themeMode ?? ThemeMode.system,
        );
}

class LoadingThemeState extends ThemeState {
  const LoadingThemeState({required super.themeMode});
}

class UnsavedThemeState extends ThemeState {
  const UnsavedThemeState({
    required super.themeMode,
  });
}

class SavedThemeState extends ThemeState {
  const SavedThemeState({
    required super.themeMode,
  });
}

class RestoredThemeState extends ThemeState {
  const RestoredThemeState([ThemeMode? themeMode]) : super(themeMode: themeMode ?? ThemeMode.system);
}
