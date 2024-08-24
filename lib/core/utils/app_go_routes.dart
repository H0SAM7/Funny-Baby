import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/admins/presentation/views/add_discount_view.dart';
import 'package:funny_baby/features/home/presentation/views/profile_view.dart';
import 'package:funny_baby/pages/search.dart';
import 'package:go_router/go_router.dart';
import 'package:funny_baby/features/auth/presentation/views/forget_password_view.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/features/auth/presentation/views/register_view.dart';
import 'package:funny_baby/features/auth/presentation/views/update_profile.dart';
import 'package:funny_baby/features/home/presentation/views/categories_view.dart';
import 'package:funny_baby/features/home/presentation/views/category_products_view.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/features/admins/presentation/views/add_products_view.dart';
import 'package:funny_baby/features/admins/presentation/views/delete_product_view.dart';
import 'package:funny_baby/features/admins/presentation/views/update_product_view.dart';
import 'package:funny_baby/features/splash/presentation/views/splash_view.dart';

abstract class AppGoRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/${MyHome.id}', // Set LoginPage as the initial route
    routes: [
      GoRoute(
        path: '/${LoginPage.id}',
        name: LoginPage.id,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/${MyHome.id}',
        name: MyHome.id,
        builder: (context, state) => const MyHome(),
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
        builder: (context, state) => const ForgetPassword(),
      ),
       GoRoute(
        path: '/${ProfileView.id}',
        name: ProfileView.id,
        builder: (context, state) => ProfileView(),
      ),
       GoRoute(
        path: '/${UserName.id}',
        name: UserName.id,
        builder: (context, state) => const UserName(),
      ),
        GoRoute(
        path: '/${SearchPage.id}',
        name: SearchPage.id,
        builder: (context, state) => const SearchPage(),
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