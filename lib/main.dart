import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_egypt/Features/Wishlist/domain/Repos/WishListRepo.dart';
import 'package:in_egypt/Features/Wishlist/presentation/manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/services/BlocObserver.dart';
import 'package:in_egypt/core/services/Shared_preferences.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/utils/App_router.dart';
import 'package:in_egypt/firebase_options.dart';
import 'package:in_egypt/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Supabase.initialize(url: supaBaseUrl, anonKey: supaBaseAnonKey),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    shared_preferences_Services.init()
  ]);

  setup_Getit();
  Bloc.observer = Custom_Blocobserver();
  runApp(const InEgypt());
}

class InEgypt extends StatelessWidget {
  const InEgypt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit(
        wishListRepo: getIt<WishListRepo>(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: carioFontFamily,
          scaffoldBackgroundColor: Colors.white,
        ),
        locale: Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: App_router.router,
      ),
    );
  }
}
