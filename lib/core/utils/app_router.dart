import 'package:go_router/go_router.dart';
import 'package:test/featuers/bottom-navigation_bar/bottom_nav_bar.dart';
import 'package:test/featuers/login_page/presentation/view/login_page.dart';
import 'package:test/featuers/login_page/presentation/view/widget/choose_page.dart';
import 'package:test/featuers/login_page_for_guide/presentation/view/login_page.dart';
import 'package:test/featuers/onboarding/presentation/views/onboarding.dart';
import 'package:test/featuers/register_page_for_guide/features/view/register_page_for_guide.dart';
import 'package:test/featuers/regitser_page_for_tourist/features/view/register_page.dart';
import 'package:test/featuers/splash_screen/presentation/view/splash_screen.dart';

class AppRouter {
  static const kHomeView = '/homeview';
  static const klogin = '/klogin';

  static const kOnBoardingScreen = '/kOnBoardingScreen';
  static const kBottomNavBar = '/kBottomNavBar';
  static const kChoosePage = '/kChoosePage';
  static const kRegisterPage = '/kRegisterPage';
  static const kRegisterPageForGuide = '/RegisterPageForGuide';
  static const kLoginPageForGuide = '/kLoginPageForGuide';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplachView()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(path: klogin, builder: (context, state) => const LoginPage()),

      GoRoute(
        path: kBottomNavBar,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: kChoosePage,
        builder: (context, state) => const ChoosePage(),
      ),
      GoRoute(
        path: kRegisterPage,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: kRegisterPageForGuide,
        builder: (context, state) => const RegisterPageForGuide(),
      ),
      GoRoute(
        path: kLoginPageForGuide,
        builder: (context, state) => const LoginPageForGuide(),
      ),
    ],
  );
}
