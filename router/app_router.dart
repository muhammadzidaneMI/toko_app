import 'package:go_router/go_router.dart';
import '../models/product.dart';
import '../routes/app_routes.dart';
import '../state/auth_state.dart';
import '../pages/splash_screen.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';
import '../pages/product_list_page.dart';
import '../pages/product_detail_page.dart';
import '../pages/checkout_page.dart';
import '../pages/not_found_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  redirect: (context, state) {
    final isLoggedIn = AuthState.isLoggedIn;
    final currentPath = state.matchedLocation;

    // Izinkan tetap di splash screen saat aplikasi baru dibuka
    if (currentPath == AppRoutes.splash) return null;

    // Jika belum login dan mencoba buka halaman lain selain login, arahkan ke login
    if (!isLoggedIn && currentPath != AppRoutes.login) {
      return AppRoutes.login;
    }

    // Jika sudah login tapi masih di halaman login, arahkan ke home
    if (isLoggedIn && currentPath == AppRoutes.login) {
      return AppRoutes.home;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.productList,
      builder: (context, state) => const ProductListPage(),
    ),
    GoRoute(
      path: AppRoutes.productDetail,
      builder: (context, state) {
        final productId = state.pathParameters['id'] ?? '1';
        return ProductDetailPage(productId: productId);
      },
    ),
    GoRoute(
      path: AppRoutes.checkout,
      builder: (context, state) {
        final product = state.extra as Product;
        return CheckoutPage(product: product);
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);