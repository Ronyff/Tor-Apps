import 'package:get/get.dart';
import 'package:tor_application/ui/views/auth/sign_in.dart';
import 'package:tor_application/ui/views/auth/sign_up.dart';
import 'package:tor_application/ui/views/onboarding_screen.dart';
import 'package:tor_application/ui/views/privacy_policy.dart';
import 'package:tor_application/ui/views/splash_screen.dart';
import 'package:tor_application/ui/views/user_form.dart';

const String splash = '/splash_screen';
const String onboarding = '/onboarding-screen';
const String signup = '/signup-screen';
const String signin = '/signin-screen';
const String userform = '/userforn-screen';
const String privacy = '/privacyPolicy-screen';
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
   GetPage(
    name: signin,
    page: () => SignIn(),
  ),
   GetPage(
    name: userform,
    page: () => UserForm(),
  ),
   GetPage(
    name: privacy,
    page: () => PrivacyPolicy(),
  ),
];
