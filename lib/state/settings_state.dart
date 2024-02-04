import 'package:equatable/equatable.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => const [];
}

class InitialSettingsState extends SettingsState {
  const InitialSettingsState();
}

class ResetThemeRequestedSettingsState extends SettingsState {
  const ResetThemeRequestedSettingsState();
}

class ChangeThemeRequestedSettingsState extends SettingsState {
  const ChangeThemeRequestedSettingsState();
}