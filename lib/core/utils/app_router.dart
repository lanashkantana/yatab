import 'package:go_router/go_router.dart';
import 'package:test/view/auth/auth_guide/login_page_by_guide_body.dart';
import 'package:test/view/auth/auth_guide/register_page_by_guide_body.dart';
import 'package:test/view/auth/auth_tourist/login_page_by_tourist_body.dart';
import 'package:test/view/auth/auth_tourist/register_page_by_tourist_body.dart';
import 'package:test/view/auth/auth_tourist/selection_page.dart';
import 'package:test/view/bottom-navigation_bar/bottom_nav_bar.dart';
import 'package:test/view/onBoarding_page/onBoardingPage.dart';
import 'package:test/view/splash_page/splash_page.dart';

class AppRouter {
  static const kLoginPageForTourist = '/kLoginPageForTourist';
  static const kRegisterPageForTourist = '/kRegisterPageForTourist';
  //
  static const kOnBoardingScreen = '/kOnBoardingScreen';
  static const kBottomNavBar = '/kBottomNavBar';

  static const kSelectionPage = '/kSelectionPage';

  ///
  static const kRegisterPageForGuide = '/RegisterPageForGuide';
  static const kLoginPageForGuide = '/kLoginPageForGuide';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplachView()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kLoginPageForTourist,
        builder: (context, state) => const LoginPageByTouristBody(),
      ),

      GoRoute(
        path: kBottomNavBar,
        builder: (context, state) => const BottomNavBar(),
      ),

      GoRoute(
        path: kSelectionPage,
        builder: (context, state) => const ChoosePage(),
      ),
      GoRoute(
        path: kRegisterPageForTourist,
        builder: (context, state) => const RegisterPageByTouristBody(),
      ),
      GoRoute(
        path: kRegisterPageForGuide,
        builder: (context, state) => const RegisterPageForGuideBody(),
      ),
      GoRoute(
        path: kLoginPageForGuide,
        builder: (context, state) => const LoginPageForGuideBody(),
      ),
    ],
  );
}
