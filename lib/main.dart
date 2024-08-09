import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/cubit/cahnge_mode.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/cubit/lang_cubit.dart';
import 'package:funny_baby/firebase_options.dart';
import 'package:funny_baby/helper/theme.dart';
import 'package:funny_baby/pages/Admin/add_products.dart';
import 'package:funny_baby/pages/Admin/add_sales.dart';
import 'package:funny_baby/pages/Admin/delete_product.dart';
import 'package:funny_baby/pages/Admin/update_product.dart';
import 'package:funny_baby/pages/auth/forget_password.dart';
import 'package:funny_baby/pages/auth/login_page.dart';
import 'package:funny_baby/pages/auth/register_page.dart';
import 'package:funny_baby/pages/auth/update_profile.dart';
import 'package:funny_baby/pages/categories_page.dart';
import 'package:funny_baby/pages/category_page.dart';
import 'package:funny_baby/pages/product_details.dart';
import 'package:funny_baby/pages/home.dart';
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
          create: (context) => GetProductCubit(),
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
              LoginPage.id: (context) => LoginPage(),
              MyHome.id: (context) => const MyHome(),
  
              UpdateProfilePage.id: (context) => UpdateProfilePage(),
              CategoriesPage.id: (context) => CategoriesPage(),
              DetailsPage.id: (context) => const DetailsPage(),
              CategoryPage.id: (context) => CategoryPage(),
              RegisterPage.id: (context) => RegisterPage(),
 
              AddProductsPage.iD: (context) => AddProductsPage(),
              UpdateProductsPage.id: (context) => UpdateProductsPage(),
              DeleteProductsPage.id: (context) => DeleteProductsPage(),
              StartPage.id: (context) => const StartPage(),
              AddSales.id: (context) => AddSales(),
              ForgetPassword.id: (context) => const ForgetPassword(),
    
            },
            debugShowCheckedModeBanner: false,
            initialRoute:StartPage.id
          );
        },
      ),
    );
  }
}
