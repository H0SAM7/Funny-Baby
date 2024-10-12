import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/Notifications/services/send_notifications_view.dart';
import 'package:funny_baby/features/admins/order_features/views/widgets/order_details.dart';
import 'package:funny_baby/features/admins/presentation/views/add_discount_view.dart';
import 'package:funny_baby/features/admins/order_features/views/orders_view.dart';
import 'package:funny_baby/features/auth/presentation/views/profile_details_view.dart';
import 'package:funny_baby/features/auth/presentation/views/start_view.dart';
import 'package:funny_baby/features/auth/presentation/views/verifications_view.dart';
import 'package:funny_baby/features/cart/presentation/views/cart_view.dart';
import 'package:funny_baby/features/home/presentation/views/settings_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/technical_support_view.dart';
import 'package:funny_baby/features/payment/presentation/views/add_order_view.dart';
import 'package:funny_baby/features/payment/presentation/views/payment_option_view.dart';
import 'package:funny_baby/features/home/presentation/views/search_view.dart';
import 'package:funny_baby/widgets/crash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:funny_baby/features/auth/presentation/views/forget_password_view.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/features/auth/presentation/views/register_view.dart';
import 'package:funny_baby/features/auth/presentation/views/update_profile.dart';
import 'package:funny_baby/features/home/presentation/views/categories_view.dart';
import 'package:funny_baby/features/home/presentation/views/category_products_view.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/bottom_navigation_bar.dart';
import 'package:funny_baby/features/admins/presentation/views/add_products_view.dart';
import 'package:funny_baby/features/admins/presentation/views/delete_product_view.dart';
import 'package:funny_baby/features/admins/presentation/views/update_product_view.dart';
import 'package:funny_baby/features/splash/presentation/views/splash_view.dart';

abstract class AppGoRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/${SplashView.id}', 
    routes: [
      GoRoute(
        path: '/${LoginPage.id}',
        name: LoginPage.id,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/${BottomNavi.id}',
        name: BottomNavi.id,
        builder: (context, state) => const BottomNavi(),
      ),
      GoRoute(
        path: '/${UpdateProfilePage.id}',
        name: UpdateProfilePage.id,
        builder: (context, state) => const UpdateProfilePage(),
      ),
      GoRoute(
        path: '/${CategoriesView.id}',
        name: CategoriesView.id,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: '/${DetailsPage.id}',
        name: DetailsPage.id,
        builder: (context, state) => DetailsPage(
          productModel: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: '/${CategoryProductsView.id}',
        name: CategoryProductsView.id,
        builder: (context, state) => CategoryProductsView(
          categoryName: state.extra as String,
        ),
      ),
      GoRoute(
        path: '/${RegisterPage.id}',
        name: RegisterPage.id,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/${AddProductsView.iD}',
        name: AddProductsView.iD,
        builder: (context, state) => const AddProductsView(),
      ),
      GoRoute(
        path: '/${UpdateProductsView.id}',
        name: UpdateProductsView.id,
        builder: (context, state) => const UpdateProductsView(),
      ),
      GoRoute(
        path: '/${DeleteProductsView.id}',
        name: DeleteProductsView.id,
        builder: (context, state) => DeleteProductsView(),
      ),
      GoRoute(
        path: '/${SplashView.id}',
        name: SplashView.id,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/${AddDiscounts.id}',
        name: AddDiscounts.id,
        builder: (context, state) => const AddDiscounts(),
      ),
      GoRoute(
        path: '/${ForgetPassword.id}',
        name: ForgetPassword.id,
        builder: (context, state) =>  ForgetPassword(),
      ),
      GoRoute(
        path: '/${ProfileView.id}',
        name: ProfileView.id,
        builder: (context, state) => const ProfileView(),
      ),

      GoRoute(
        path: '/${SearchPage.id}',
        name: SearchPage.id,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: '/${CartView.id}',
        name: CartView.id,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: '/${PaymentOptionView.id}',
        name: PaymentOptionView.id,
        builder: (context, state) => PaymentOptionView(
          items: state.extra as List<ProductModel>,
        ),
      ),
      GoRoute(
        path: '/${ProfileDetailsView.id}',
        name: ProfileDetailsView.id,
        builder: (context, state) => const ProfileDetailsView(),
      ),
      GoRoute(
        path: '/${AddOrderView.id}',
        name: AddOrderView.id,
        builder: (context, state) => AddOrderView(
          items: state.extra as List<ProductModel>,
        ),
      ),
      GoRoute(
        path: '/${TechnicalSupportView.id}',
        name: TechnicalSupportView.id,
        builder: (context, state) => const TechnicalSupportView(),
      ),
      GoRoute(
        path: '/${CrashView.id}',
        name: CrashView.id,
        builder: (context, state) => const CrashView(),
      ),
        GoRoute(
        path: '/${OrdersView.id}',
        name: OrdersView.id,
        builder: (context, state) => const OrdersView(),
      ),
          GoRoute(
        path: '/${OrderDetails.id}',
        name: OrderDetails.id,
        builder: (context, state) =>  OrderDetails(products: state.extra as List<ProductModel>,),
      ),
           GoRoute(
        path: '/${VerificationView.id}',
        name: VerificationView.id,
        builder: (context, state) => const VerificationView(),
      ),
       GoRoute(
        path: '/${StartView.id}',
        name: StartView.id,
        builder: (context, state) => const StartView(),
      ),
       GoRoute(
        path: '/${NotifactionsSendView.id}',
        name: NotifactionsSendView.id,
        builder: (context, state) => const NotifactionsSendView(),
      ),
    ],
  );
}

extension GoRouterExtension on GoRouter {
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
