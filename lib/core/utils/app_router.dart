
import 'package:go_router/go_router.dart';
import 'package:test/featuers/home_page/features/view/home_page.dart';
import 'package:test/featuers/login_page/presentation/view/login_page.dart';
import 'package:test/featuers/login_page/presentation/view/widget/choose_page.dart';
import 'package:test/featuers/onboarding/presentation/views/onboarding.dart';
import 'package:test/featuers/regitser_page/features/view/register_page.dart';
import 'package:test/featuers/splash_screen/presentation/view/splash_screen.dart';

class AppRouter {
  static const kHomeView = '/homeview';
  static const klogin = '/klogin';

  static const kOnBoardingScreen = '/kOnBoardingScreen';
 static const kHomePage = '/kHomePage';
 static const kChoosePage = '/kChoosePage';
static const kRegisterPage = '/kRegisterPage';

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
   
      GoRoute(
        path: kHomePage,
        builder: (context, state) => const HomePage(),
      ),  GoRoute(
        path: kChoosePage,
        builder: (context, state) => const ChoosePage(),
      ),
       GoRoute(
        path: kRegisterPage,
        builder: (context, state) => const RegisterPage(),
      ), 
    ],
  );
}
