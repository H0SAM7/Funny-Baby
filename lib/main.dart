import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/core/utils/app_go_routes.dart';
import 'package:funny_baby/cubit/cahnge_mode.dart';
import 'package:funny_baby/cubit/lang_cubit.dart';
import 'package:funny_baby/features/admins/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/discounts_cubit/discounts_cubit.dart';
import 'package:funny_baby/firebase_options.dart';
import 'package:funny_baby/helper/theme.dart';
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
          return MaterialApp.router(
              locale: context.watch<LanguageCubit>().state,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              theme: MyAppThemes.lightTheme,
              darkTheme: MyAppThemes.darkTheme,
              themeMode: themeModeState == ThemeModeState.light
                  ? ThemeMode.light
                  : ThemeMode.dark,

                
              debugShowCheckedModeBanner: false,
              routerConfig: AppGoRoutes.router,
              );
        },
      ),
    );
  }
}
