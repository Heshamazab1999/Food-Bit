import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/category_screen.dart';
import 'package:app/screens/edit_profile.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/map_screen.dart';
import 'package:app/screens/order-screen.dart';
import 'package:app/screens/product_details.dart';
import 'package:app/screens/register.dart';
import 'package:get/get.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/location_between.dart';
import 'package:app/screens/my_location_screen.dart';
class AppScreen {
  static final screen = [
    GetPage(
      name: AppRoute.splash_screen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: AppRoute.category_screen,
      page: () => CategoryScreen(),
    ),
    GetPage(
      name: AppRoute.register_screen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoute.login_screen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoute.cart_screen,
      page: () => CartScreen(),
    ),
    GetPage(
      name: AppRoute.map_screen,
      page: () => MapScreen(),
    ),
    GetPage(
      name: AppRoute.product_screen,
      page: () => ProductDetails(),
    ),
    GetPage(
      name: AppRoute.profile_screen,
      page: () => ProfileScreen(),
    ),GetPage(
      name: AppRoute.home_screen,
      page: () => HomeScreen(),
    ),GetPage(
      name: AppRoute.order_screen,
      page: () => OrderScreen(),
    ),GetPage(
      name: AppRoute.location_between_screen,
      page: () => LocationBetween(),
    ),GetPage(
      name: AppRoute.my_location_screen,
      page: () => MyLocationScreen(),
    ),GetPage(
      name: AppRoute.edit_profile,
      page: () => EditProfile(),
    ),
  ];
}
