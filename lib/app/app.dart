import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:push_up_counter/cubits/theme_cubit.dart';
import 'package:push_up_counter/pages/dashboard_page.dart';
import 'package:push_up_counter/response/detail_page_response.dart';
import 'package:push_up_counter/response/settings_page_response.dart';

import '../cubits/setting_cubit.dart';
import '../state/theme_state.dart';
import '../pages/detail_page.dart';
import '../pages/settings_page.dart';

part 'app.injection.dart';

part 'app.router.dart';

part 'app.bindings.dart';

part 'app.theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBindings(
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (
        context,
        themeState,
      ) {
        return MaterialApp.router(
          restorationScopeId: AppRouter.restorationScopeId,
          routerConfig: AppRouter.router,
          theme: AppTheme.theme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState.themeMode,
        );
      }),
    );
  }
}
