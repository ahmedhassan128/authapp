import 'package:authapp/app/modules/splash_welcom/bindings/splash_welcome_binding.dart';
import 'package:authapp/app/modules/splash_welcom/views/splash_welcome_view.dart';
import 'package:authapp/app/modules/successful/bindings/success_binding.dart';
import 'package:authapp/app/modules/successful/views/success_view.dart';
import 'package:get/get.dart';

import '../modules/neutral/bindings/neutral_binding.dart';
import '../modules/neutral/views/neutral_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/low_stress/bindings/low_trust_binding.dart';
import '../modules/low_stress/views/low_trust_view.dart';
import '../modules/high_stress/bindings/high_stress_binding.dart';
import '../modules/high_stress/views/high_stress_view.dart';
import '../modules/restpassword/bindings/restpassword_binding.dart';
import '../modules/restpassword/views/restpassword_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  // i set page route signup when execute application first SPLASH page will be open
// you can change page route according to requirement
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESTPASSWORD,
      page: () => const RestpasswordView(),
      binding: RestpasswordBinding(),
    ),
    GetPage(
      name: _Paths.HIGH_TRUST,
      page: () => const NautralView(),
      binding: NeutralBinding(),
    ),
    GetPage(
      name: _Paths.MEDIUM_TRUST,
      page: () => const HighStressView(),
      binding: HighStressBinding(),
    ),
    GetPage(
      name: _Paths.LOW_TRUST,
      page: () => const LowStressView(),
      binding: LowStressBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.Successful,
      page: () => const SuccessfulView(),
      binding: SuccessfulBinding(),
    ),
    GetPage(
      name: _Paths.SplashWelcome,
      page: () => const SplashWelcomeView(),
      binding: SplashWelComeBinding(),
    ),
  ];
}
