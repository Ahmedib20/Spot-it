import 'package:get/get.dart';
import 'package:spot_it/auth/presentation/screens/reset_password/reset_password_view.dart';
import 'package:spot_it/auth/presentation/screens/signin_view/signin_view.dart';
import 'package:spot_it/auth/presentation/screens/signup_view/signup_view.dart';
import 'package:spot_it/middlewares/onboarding_middleware.dart';
import 'package:spot_it/view/account_view/account_edit_view.dart';
import 'package:spot_it/view/boarding_view/onboarding_view.dart';
import 'package:spot_it/view/home_view/home_screen.dart';
import 'package:spot_it/view/navigation_menu.dart';
import 'package:spot_it/view/place_details_view/place_details_view.dart';
import 'package:spot_it/view/splash_view/splash_view.dart';
import 'package:spot_it/view/view_all_page/view_all_page.dart';

List<GetPage> getPagesList = [
  GetPage(
    name: '/',
    page: () => const SplashView(),
  ),
  GetPage(
    name: '/onBoarding',
    page: () => const OnboardingView(),
    middlewares: [
      OnboardingMiddleware(),
    ],
  ),
  GetPage(
    name: '/signin',
    page: () => const SigninView(),
  ),
  GetPage(
    name: '/navigation',
    page: () => const NavigationMenu(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: '/signup',
    page: () => const SignUpView(),
  ),
  GetPage(
    name: '/resetpassword',
    page: () => const ResetPasswordView(),
  ),
  GetPage(
    name: '/detailsView',
    page: () => const PlaceDetailsView(),
  ),
  GetPage(
    name: '/accountEdit',
    page: () => const AccountEditView(),
  ),
  GetPage(
    name: '/viewAll',
    page: () => const ViewAllPage(),
  ),
];
