import 'package:get/get.dart';
import 'package:sport_shop/features/authentication/screens/login/login.dart';
import 'package:sport_shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sport_shop/features/authentication/screens/password/forget_password.dart';
import 'package:sport_shop/features/authentication/screens/signup/signup.dart';
import 'package:sport_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:sport_shop/features/personalization/screens/address/adress.dart';
import 'package:sport_shop/features/personalization/screens/profile/profile.dart';
import 'package:sport_shop/features/personalization/screens/settings/settings.dart';
import 'package:sport_shop/features/shop/screens/cart/cart.dart';
import 'package:sport_shop/features/shop/screens/checkout/checkout.dart';
import 'package:sport_shop/features/shop/screens/home/home.dart';
import 'package:sport_shop/features/shop/screens/order/order.dart';
import 'package:sport_shop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:sport_shop/features/shop/screens/store/store.dart';
import 'package:sport_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:sport_shop/routes/routes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: MyRouts.home, page: () => const HomeScreen()),
    GetPage(name: MyRouts.store, page: () => const StoreScreen()),
    GetPage(name: MyRouts.fav, page: () => const FavouriteScreen()),
    GetPage(name: MyRouts.settings, page: () => const SettingsScreen()),
    GetPage(name: MyRouts.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: MyRouts.order, page: () => const OrderScreen()),
    GetPage(name: MyRouts.checkout, page: () => const CheckoutScreen()),
    GetPage(name: MyRouts.cart, page: () => const CartScreen()),
    GetPage(name: MyRouts.userProfile, page: () => const ProfileScreen()),
    GetPage(name: MyRouts.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: MyRouts.signup, page: () => const SignupScreen()),
    GetPage(name: MyRouts.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: MyRouts.signIn, page: () => const LoginScreen()),
    GetPage(name: MyRouts.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: MyRouts.onBoarding, page: () => const OnBoardingScreen()),
  ];
}