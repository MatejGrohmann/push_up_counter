part of 'app.dart';

class AppBindings extends StatelessWidget {
  const AppBindings({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => getIt<ThemeCubit>())
      ],
      child: child,
    );
  }
}
