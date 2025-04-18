
import 'package:go_router/go_router.dart';
import 'package:test/featuers/auth_page/presentation/view/login_page.dart';
import 'package:test/featuers/onboarding/presentation/views/onboarding.dart';
import 'package:test/featuers/splash_screen/presentation/view/splash_screen.dart';

class AppRouter {
  static const kHomeView = '/homeview';
  static const klogin = '/klogin';
  static const kOnBoardingScreen = '/kOnBoardingScreen';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplachView(),
      ),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: klogin,
        builder: (context, state) => const LoginPage(),
      ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => const SearchView(),
      // ),
    ],
  );
}
