import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/bloc_observer.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/utils/app_go_routes.dart';
import 'package:funny_baby/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:funny_baby/features/payment/presentation/manager/cubit/add_order_cubit.dart';
import 'package:funny_baby/system_cubits/cahnge_mode.dart';
import 'package:funny_baby/system_cubits/lang_cubit.dart';
import 'package:funny_baby/features/admins/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/discounts_cubit/discounts_cubit.dart';
import 'package:funny_baby/firebase_options.dart';
import 'package:funny_baby/core/helper/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('cart');
  Bloc.observer = SimpleBlocObserever();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
      FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  runApp(
    const FunnyBaby(),
  );
  //runApp(DevicePreview(enabled: true, builder: (context) => const FunnyBaby(),),);
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
        BlocProvider(
          create: (context) => DiscountsCubit()..getAllDiscounts(),
        ),
        BlocProvider(
          create: (context) => AdminCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => AddOrderCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, themeModeState) {
          return MaterialApp.router(
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
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
