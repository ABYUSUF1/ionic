final class AppRouterName {
  // onboarding routes
  static const String onboardingRoute = '/onboarding';

  // Auth routes
  static const String signInRoute = '/sign-in';
  static const String signUpRoute = '/sign-up';
  static const String forgetPasswordRoute = '/forget-password';
  static const String emailSentRoute = '/email-sent';

  // main routes
  static const String homeRoute = '/home'; // initial route
  static const String profileRoute = '/profile';
  static const String cartRoute = '/cart';
  static const String categoriesRoute = '/categories';

  // inside profile routes
  static const String editProfileRoute = 'edit-profile';
  static const String notificationsRoute = 'notifications';

  // favorites route
  static const String favoriteRoute = '/favorite';

  // product details route
  static const String productRoute = '/product/:productId';
  static String productIdRoute(String productId) {
    return '/product/$productId';
  }

  // search route
  static const String searchRoute = '/search';

  // Addresses Route
  static const String defaultAddressRoute = '/default-address';
  static const String locateOnMapRoute = '/locate-on-map';
  static const String saveAddressRoute = '/save-address';

  // checkout routes
  static const String checkoutRoute = '/checkout';
  static const String checkoutSuccessRoute = '/checkout-success';

  /// orders routes
  static const String ordersRoute = '/orders';
  static const String orderDetailsRoute = '/order-details';
}
