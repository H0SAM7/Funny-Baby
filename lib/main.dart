import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/cubit/cahnge_mode.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/cubit/lang_cubit.dart';
import 'package:funny_baby/features/admins/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:funny_baby/features/admins/presentation/views/add_products_view.dart';
import 'package:funny_baby/features/admins/presentation/views/add_discount_view.dart';
import 'package:funny_baby/features/admins/presentation/views/update_product_view.dart';
import 'package:funny_baby/features/auth/presentation/views/forget_password.dart';
import 'package:funny_baby/features/auth/presentation/views/login_page.dart';
import 'package:funny_baby/features/auth/presentation/views/register_page.dart';
import 'package:funny_baby/features/auth/presentation/views/update_profile.dart';
import 'package:funny_baby/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/discounts_cubit/discounts_cubit.dart';
import 'package:funny_baby/features/home/presentation/views/categories_view.dart';
import 'package:funny_baby/features/home/presentation/views/category_products_view.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/firebase_options.dart';
import 'package:funny_baby/helper/theme.dart';

import 'package:funny_baby/features/admins/presentation/views/delete_product_view.dart';

import 'package:funny_baby/pages/start_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const FunnyBaby());
}

class FunnyBaby extends StatelessWidget {
  const FunnyBaby({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductsCubit()..getAllProducts(),
        ),
        BlocProvider(create: (context) => DiscountsCubit()..getAllDiscounts()),
            BlocProvider(
          create: (context) => AdminCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, themeModeState) {
          return MaterialApp(
            locale: context.watch<LanguageCubit>().state,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:  const [
              Locale('en', ''),
              Locale('ar', ''),
            
            ],
            theme: MyAppThemes.lightTheme,
            darkTheme: MyAppThemes.darkTheme,
            themeMode: themeModeState == ThemeModeState.light
                ? ThemeMode.light
                : ThemeMode.dark,
            routes: {
              LoginPage.id: (context) => const LoginPage(),
              MyHome.id: (context) => const MyHome(),
  
              UpdateProfilePage.id: (context) => const UpdateProfilePage(),
              CategoriesView.id: (context) => const CategoriesView(),
              DetailsPage.id: (context) => const DetailsPage(),
              CategoryProductsView.id: (context) => const CategoryProductsView(),
              RegisterPage.id: (context) => const RegisterPage(),
 
              AddProductsPage.iD: (context) => const AddProductsPage(),
              UpdateProductsPage.id: (context) => const UpdateProductsPage(),
              DeleteProductsPage.id: (context) => DeleteProductsPage(),
              StartPage.id: (context) => const StartPage(),
              AddSales.id: (context) => const AddSales(),
              ForgetPassword.id: (context) => const ForgetPassword(),
    
            },
            debugShowCheckedModeBanner: false,
            initialRoute:MyHome.id
          );
        },
      ),
    );
  }
}
