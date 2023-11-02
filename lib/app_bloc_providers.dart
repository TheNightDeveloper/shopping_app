import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/pages/auth%20page/bloc/auth_bloc.dart';
import 'package:shopping_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocs => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
          lazy: false,
        ),
        BlocProvider(create: (context) => AuthBloc())
      ];
}
