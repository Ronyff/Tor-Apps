import 'package:get/get.dart';
import 'package:tor_application/ui/views/auth/sign_up.dart';
import 'package:tor_application/ui/views/onboarding_screen.dart';
import 'package:tor_application/ui/views/splash_screen.dart';

const String splash = '/splash_screen';
const String onboarding = '/onboarding-screen';
const String signup = '/signup-screen';
List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnboardingScreen(),
  ),
  GetPage(
    name: signup,
    page: () => SignUp(),
  ),
];
