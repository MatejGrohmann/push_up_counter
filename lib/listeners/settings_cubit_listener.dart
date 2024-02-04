import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/utils/notification_util.dart';
import 'package:push_up_counter/views/theme_change_view.dart';

import '../cubits/setting_cubit.dart';
import '../cubits/theme_cubit.dart';
import '../state/settings_state.dart';

class SettingsCubitListener extends BlocListener<SettingsCubit, SettingsState> {
  const SettingsCubitListener({
    required super.child,
    super.key,
  }) : super(
          listener: onListener,
        );

  static void onListener(BuildContext context, SettingsState state) {
    if (state is InitialSettingsState) {
      return;
    }
    final settingsCubit = context.read<SettingsCubit>();
    themeCubit() => context.read<ThemeCubit>();
    if (state is ResetThemeRequestedSettingsState) {
      NotificationUtil.showConfirmationDialog(
        context: context,
        title: 'Are you sure?',
        content: 'Do you want to reset the theme? This action cannot be undone.',
      ).then(
        (wasConfirmed) async {
          settingsCubit.reset();
          if (wasConfirmed) {
            await themeCubit().resetTheme();
          }
        },
      );
    }
    if (state is ChangeThemeRequestedSettingsState) {
      showThemeChangeBottomSheet(context: context).then(
        (wasConfirmed) {
          settingsCubit.reset();
          if (wasConfirmed) {
            themeCubit().storeTheme();
          } else {
            themeCubit().fetchTheme();
          }
        },
      );
    }
  }
}
