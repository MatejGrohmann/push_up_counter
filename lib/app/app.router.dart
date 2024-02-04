part of 'app.dart';

class AppRouter {
  static const restorationScopeId = 'app-restoration-id';

  static GoRouter router = GoRouter(
    restorationScopeId: restorationScopeId,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppRoutes.dashboard,
        name: AppRoutes.dashboard,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            restorationId: 'dashboard-restoration-id',
            key: state.pageKey,
            child: const DashboardPage(),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.detail,
            name: AppRoutes.detail,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                restorationId: 'detail-restoration-id',
                key: state.pageKey,
                child: DetailPage(
                  id: state.uri.queryParameters['id'],
                ),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.settings,
            name: AppRoutes.settings,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                restorationId: 'settings-restoration-id',
                key: state.pageKey,
                child: const SettingsPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}

class AppNavigator {
  static Future<void> pushDetailPage(
      {required BuildContext context, required String? id, ValueChanged<DetailPageResponse?>? onClosed}) async {
    await context.pushNamed<DetailPageResponse>(
      AppRoutes.detail,
      queryParameters: {'id': id},
    ).then(
      (response) {
        onClosed?.call(response);
      },
    );
  }

  static Future<void> pushSettingsPage(
      {required BuildContext context, ValueChanged<SettingsPageResponse?>? onClosed}) async {
    await context.pushNamed<SettingsPageResponse?>(AppRoutes.settings).then(
      (response) {
        onClosed?.call(response);
      },
    );
  }

  static goBack<T extends Object>({required BuildContext context, T? update}) {
    return context.pop<T?>(update);
  }
}

class AppRoutes {
  static const dashboard = '/';
  static const settings = 'settings';
  static const detail = 'detail';
}
