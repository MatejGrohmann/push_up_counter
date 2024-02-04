import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/setting_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Settings Page'),
          ElevatedButton(
            onPressed: () {
              context.read<SettingsCubit>().requestChangeTheme();
            },
            child: const Text('Change theme'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SettingsCubit>().requestResetTheme();
            },
            child: const Text('Reset theme'),
          ),
        ],
      ),
    );
  }
}
