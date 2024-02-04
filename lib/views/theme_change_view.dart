import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/theme_cubit.dart';
import '../state/theme_state.dart';

Future<bool> showThemeChangeBottomSheet({
  required BuildContext context,
}) async {
  return await showModalBottomSheet<bool>(
    context: context,
    builder: (_) {
      return BlocProvider<ThemeCubit>.value(
        value: context.read<ThemeCubit>(),
        child: const ThemeChangeView(),
      );
    },
  ).then((value) => value ?? false);
}

class ThemeChangeView extends StatelessWidget {
  const ThemeChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    saveTheme() {
      context.pop(true);
    }

    close() {
      context.pop(false);
    }

    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            SizedBox(
              width: 80,
              child: Divider(
                thickness: 1,
                color: colorScheme.scrim,
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                final groupValue = state.themeMode;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThemeRadioButton(value: ThemeMode.system, groupValue: groupValue),
                    ThemeRadioButton(value: ThemeMode.light, groupValue: groupValue),
                    ThemeRadioButton(value: ThemeMode.dark, groupValue: groupValue),
                  ],
                );
              },
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ThemeButton(
                    onPressed: close,
                    label: 'Cancel',
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: ThemeButton(
                    onPressed: saveTheme,
                    label: 'Save',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.tertiaryContainer,
      ),
      child: Text(
        label,
        style: TextStyle(color: colorScheme.onTertiaryContainer),
      ),
    );
  }
}

class ThemeRadioButton extends StatelessWidget {
  const ThemeRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
  });

  final ThemeMode value;
  final ThemeMode groupValue;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    setTheme([_]) => context.read<ThemeCubit>().setTheme(themeMode: value);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: setTheme,
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          height: 100,
          width: 100,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color:
                isSelected ? Theme.of(context).colorScheme.secondaryContainer : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.surface,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                switch (value) {
                  ThemeMode.system => 'System',
                  ThemeMode.light => 'Light',
                  ThemeMode.dark => 'Dark',
                },
              ),
              Radio(
                value: value,
                groupValue: groupValue,
                onChanged: setTheme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
