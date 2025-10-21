import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care_project/features/onboarding/pages/onboarding_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'core/ theme/app_theme.dart';
import 'core/network/dio.dart';
import 'features/auth/login/login_screen.dart';
import 'features/auth/register/register_user_screen.dart';
import 'features/auth/reset_password/reset_password_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  await Hive.openBox('authBox');
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 924),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
        theme: AppTheme.lightTheme.copyWith(
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'SF Arabic'),
        ),
      supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
      locale: const Locale('ar', 'EG'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(context)=>OnboardingScreen(),
        Loginscreen.routeName:(context)=>Loginscreen(),
        RegisterUserScreen.routeName:(context)=>RegisterUserScreen(),
        ResetPasswordScreen.routeName:(context)=>ResetPasswordScreen(email: '', code: '',),
      },
      );
     }
    );
  }
}
