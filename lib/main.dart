import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/controller/language_cubit/local_cubit.dart';

import 'core/utils/app_router.dart';
import 'core/utils/theme_manager.dart';
import 'generated/l10n.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentTheme, _) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp.router(
                    routerConfig: AppRouter.router,
                    debugShowCheckedModeBanner: false,
                    locale: locale, // 👈 switch locale based on cubit
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    title: 'Flutter Demo',
                    theme: ThemeData.light().copyWith(
                      scaffoldBackgroundColor: Colors.white,
                      cardColor: const Color.fromARGB(255, 138, 126, 126),
                      textTheme: GoogleFonts.montserratTextTheme(
                        ThemeData.light().textTheme,
                      ),
                    ),
                    darkTheme: ThemeData.dark().copyWith(
                      scaffoldBackgroundColor: const Color.fromARGB(255, 44, 41, 41),
                      cardColor: Colors.grey.shade800,
                      textTheme: GoogleFonts.montserratTextTheme(
                        ThemeData.dark().textTheme,
                      ),
                    ),
                    themeMode: currentTheme,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
