import 'package:go_router/go_router.dart';
import 'package:test/view/HomePage/booking_page/private_tour/private_tour.dart';
import 'package:test/view/HomePage/booking_page/public_tour/public_page.dart';


import 'package:test/view/HomePage/hotel_page/hotel_page.dart';
import 'package:test/view/HomePage/payment/payment_details_view.dart';
import 'package:test/view/HomePage/person_page/barcode_page.dart';
import 'package:test/view/HomePage/person_page/chatwithApp.dart';
import 'package:test/view/HomePage/person_page/edit_profile.dart';
import 'package:test/view/auth/auth_guide/register_page_by_guide_body.dart';
import 'package:test/view/auth/auth_tourist/login_page_by_tourist_body.dart';
import 'package:test/view/auth/auth_tourist/register_page_by_tourist_body.dart';
import 'package:test/view/auth/auth_tourist/selection_page.dart';
import 'package:test/view/bottom-navigation_bar/bottom_nav_bar.dart';
import 'package:test/view/onBoarding_page/on_boarding_page.dart';
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
  static const kEditProfile = '/kEditProfile';

  static const khotelDetails = '/hotelDetails';
  static const kHotelHomeScreen = '/kHotelHomeScreen';
 static const kPayment = '/kPayment';
  
static const kPublicPage = '/kPublicPage';
static const kPrivatePage = '/kPrivatePage';

static const kQRCodePage = '/kQRCodePage';
 static const kChatWithApp = '/kChatWithApp';


  

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) =>
       const SplachView()),
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
        path: kEditProfile,
        builder: (context, state) => const EditProfile(),
      ),

      GoRoute(
        path: kHotelHomeScreen,
        builder: (context, state) => const HotelHomeScreen(),
      ),
      GoRoute(
        path: kPayment,
        builder: (context, state) => const PaymentDetailsView(),
      ),
      GoRoute(
        path: kPublicPage,
        builder: (context, state) => const PublicPage(),
      ),
        GoRoute(
        path: kPrivatePage,
        builder: (context, state) => const PrivateTour(),
      ),
        GoRoute(
        path: kQRCodePage,
        builder: (context, state) => const QRCodePage(),
      ),
        GoRoute(
        path: kChatWithApp,
        builder: (context, state) => ChatPage(),
      ),
      
    ],
  );
}
