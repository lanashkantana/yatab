import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/core/utils/app_router.dart';
import 'package:test/core/utils/theme_manager.dart'; // Import the notifier

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, _) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,

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
  }
}
