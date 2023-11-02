import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/common/routes/names.dart';
import 'package:shopping_app/pages/auth%20page/bloc/auth_bloc.dart';
import 'package:shopping_app/pages/auth%20page/login_page.dart';
import 'package:shopping_app/pages/auth%20page/sign_up.dart';
import 'package:shopping_app/pages/main_pages/bloc/main_bloc.dart';
import 'package:shopping_app/pages/main_pages/main_screen.dart';
import 'package:shopping_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:shopping_app/pages/welcome/welcome_page.dart';

class AppPages {
  // return page entities
  static List<PageEntity> pages() {
    return [
      PageEntity(
          route: AppRoutes.initial,
          page: WelcomePage(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
       PageEntity(
          route: AppRoutes.loginPage,
          page: LoginPage(),
          bloc: BlocProvider(create: (_) => AuthBloc())),
      PageEntity(
          route: AppRoutes.signupPage,
          page: const SignUpPage(),
          bloc: BlocProvider(create: (_) => AuthBloc())),
      PageEntity(
          route: AppRoutes.mainPage,
          page: const MainScreen(),
          bloc: BlocProvider(create: (_) => MainBloc()))
    ];
  }

  // return all bloc providers
  static List allBlocProviders(BuildContext context) {
    List blocProviders = [];
    for (var bloc in pages()) {
      blocProviders.add(bloc.bloc);
    }
    print(blocProviders);
    return blocProviders;
  }

  // return routes models for pages
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    // check  routes name matching when Navigator called
    if (settings.name != null) {
      var result = pages().where((element) => element.route == settings.name!);
      if (result.isNotEmpty) {
        print('valid routes ${settings.name}');
        return MaterialPageRoute(
            builder: (_) => result.first.page as Widget, settings: settings);
      }
    }
    print('invalid routes ${settings.name}');
    return MaterialPageRoute(builder: (_) => LoginPage());
  }
}

// unifying Bloc , pages and routes
class PageEntity {
  String? route;
  Widget? page;
  dynamic bloc;
  PageEntity({this.route, this.page, this.bloc});
}
