import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/app/app.dart';
import 'package:push_up_counter/cubits/setting_cubit.dart';
import 'package:push_up_counter/listeners/settings_cubit_listener.dart';
import 'package:push_up_counter/listeners/theme_cubit_listener.dart';

import '../views/settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => getIt<SettingsCubit>(),
      child: ThemeCubitListener(
        child: SettingsCubitListener(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Settings Page'),
            ),
            body: const SettingsView(),
          ),
        ),
      ),
    );
  }
}
