import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/pages/auth%20page/bloc/auth_bloc.dart';
import 'package:shopping_app/pages/auth%20page/login_page.dart';
import 'package:shopping_app/pages/auth%20page/sign_in.dart';
import 'package:shopping_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:shopping_app/pages/welcome/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WelcomeBloc()),
          BlocProvider(create: (context) => AuthBloc())
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            routes: {
              'LoginPage': (context) => LoginPage(),
              'SignInPage': (context) => const SignInPage(),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: WelcomePage(),
          ),
        ));
  }
}
