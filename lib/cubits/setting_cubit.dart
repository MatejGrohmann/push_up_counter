import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/state/settings_state.dart';

abstract class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const InitialSettingsState());

  void requestResetTheme();

  void requestChangeTheme();

  void reset();
}

class SettingsCubitImpl extends SettingsCubit {
  @override
  void requestResetTheme() {
    emit(const ResetThemeRequestedSettingsState());
  }

  @override
  void requestChangeTheme() {
    emit(const ChangeThemeRequestedSettingsState());
  }

  @override
  void reset() {
    emit(const InitialSettingsState());
  }
}