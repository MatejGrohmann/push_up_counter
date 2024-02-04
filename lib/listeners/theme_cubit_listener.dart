import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/utils/notification_util.dart';

import '../cubits/theme_cubit.dart';
import '../state/theme_state.dart';

class ThemeCubitListener extends BlocListener<ThemeCubit, ThemeState> {
  const ThemeCubitListener({
    required super.child,
    super.key,
  }) : super(
          listener: onListener,
        );

  static void onListener(BuildContext context, ThemeState state) {
    if (state is SavedThemeState) {
      NotificationUtil.showSnackBarMessage(
        context: context,
        message: 'Theme was saved successfully',
      );
    }
    if (state is RestoredThemeState) {
      NotificationUtil.showSnackBarMessage(
        context: context,
        message: 'Theme was restored successfully',
      );
    }
  }
}
