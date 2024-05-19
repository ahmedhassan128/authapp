import 'package:get/get.dart';

import '../modules/high_trust/bindings/high_trust_binding.dart';
import '../modules/high_trust/views/high_trust_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/low_trust/bindings/low_trust_binding.dart';
import '../modules/low_trust/views/low_trust_view.dart';
import '../modules/medium_trust/bindings/medium_trust_binding.dart';
import '../modules/medium_trust/views/medium_trust_view.dart';
import '../modules/restpassword/bindings/restpassword_binding.dart';
import '../modules/restpassword/views/restpassword_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP;

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
      page: () => const HighTrustView(),
      binding: HighTrustBinding(),
    ),
    GetPage(
      name: _Paths.MEDIUM_TRUST,
      page: () => const MediumTrustView(),
      binding: MediumTrustBinding(),
    ),
    GetPage(
      name: _Paths.LOW_TRUST,
      page: () => const LowTrustView(),
      binding: LowTrustBinding(),
    ),
  ];
}
