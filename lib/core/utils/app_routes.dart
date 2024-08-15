
import 'package:go_router/go_router.dart';
import 'package:funny_baby/features/auth/presentation/views/forget_password.dart';
import 'package:funny_baby/features/auth/presentation/views/login_page.dart';
import 'package:funny_baby/features/auth/presentation/views/register_page.dart';
import 'package:funny_baby/features/auth/presentation/views/update_profile.dart';
import 'package:funny_baby/features/home/presentation/views/categories_view.dart';
import 'package:funny_baby/features/home/presentation/views/category_products_view.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/pages/Admin/add_products.dart';
import 'package:funny_baby/pages/Admin/add_sales.dart';
import 'package:funny_baby/pages/Admin/delete_product.dart';
import 'package:funny_baby/pages/Admin/update_product.dart';
import 'package:funny_baby/pages/start_page.dart';

abstract class AppRoutes {
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: LoginPage.id,
      name: LoginPage.id,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: MyHome.id,
      name: MyHome.id,
      builder: (context, state) => const MyHome(),
    ),
    GoRoute(
      path: UpdateProfilePage.id,
      name: UpdateProfilePage.id,
      builder: (context, state) => const UpdateProfilePage(),
    ),
    GoRoute(
      path: CategoriesView.id,
      name: CategoriesView.id,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: DetailsPage.id,
      name: DetailsPage.id,
      builder: (context, state) => const DetailsPage(),
    ),
    GoRoute(
      path: CategoryProductsView.id,
      name: CategoryProductsView.id,
      builder: (context, state) => const CategoryProductsView(),
    ),
    GoRoute(
      path: RegisterPage.id,
      name: RegisterPage.id,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: AddProductsPage.iD,
      name: AddProductsPage.iD,
      builder: (context, state) => const AddProductsPage(),
    ),
    GoRoute(
      path: UpdateProductsPage.id,
      name: UpdateProductsPage.id,
      builder: (context, state) => const UpdateProductsPage(),
    ),
    GoRoute(
      path: DeleteProductsPage.id,
      name: DeleteProductsPage.id,
      builder: (context, state) =>  DeleteProductsPage(),
    ),
    GoRoute(
      path: StartPage.id,
      name: StartPage.id,
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: AddSales.id,
      name: AddSales.id,
      builder: (context, state) => const AddSales(),
    ),
    GoRoute(
      path: ForgetPassword.id,
      name: ForgetPassword.id,
      builder: (context, state) => const ForgetPassword(),
    ),
  ],
);



}
