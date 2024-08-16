
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/admins/presentation/views/add_discount_view.dart';
import 'package:go_router/go_router.dart';
import 'package:funny_baby/features/auth/presentation/views/forget_password.dart';
import 'package:funny_baby/features/auth/presentation/views/login_page.dart';
import 'package:funny_baby/features/auth/presentation/views/register_page.dart';
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
  initialLocation: '/${MyHome.id}',  // Set LoginPage as the initial route
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
        builder: (context, state) =>  DetailsPage(productModel: state.extra as ProductModel,),
      ),
      GoRoute(
        path: '/${CategoryProductsView.id}',
        name: CategoryProductsView.id,
        builder: (context, state) =>  CategoryProductsView(categoryName: state.extra as String,),
      ),
      GoRoute(
        path: '/${RegisterPage.id}',
        name: RegisterPage.id,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/${AddProductsPage.iD}',
        name: AddProductsPage.iD,
        builder: (context, state) => const AddProductsPage(),
      ),
      GoRoute(
        path: '/${UpdateProductsPage.id}',
        name: UpdateProductsPage.id,
        builder: (context, state) => const UpdateProductsPage(),
      ),
      GoRoute(
        path: '/${DeleteProductsPage.id}',
        name: DeleteProductsPage.id,
        builder: (context, state) => DeleteProductsPage(),
      ),
      GoRoute(
        path: '/${SplashView.id}',
        name: SplashView.id,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/${AddSales.id}',
        name: AddSales.id,
        builder: (context, state) => const AddSales(),
      ),
      GoRoute(
        path: '/${ForgetPassword.id}',
        name: ForgetPassword.id,
        builder: (context, state) => const ForgetPassword(),
      ),
    ],
  );

}


extension GoRouterExtension on GoRouter{
  void clearStackAndNavigate(String location){
    while(canPop()){
      pop();
    }
    pushReplacement(location);
  }
}