
import 'package:funny_baby/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String kHomeView = '/HomeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', // ====> iniail route
        builder: (context, state) => const HomePage(),
      ),
   
    ],
  );
}
