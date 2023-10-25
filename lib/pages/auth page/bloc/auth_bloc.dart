import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailEvent>((event, emit) {
      emit(state.getEmailandPassword(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.getEmailandPassword(password: event.password));
    });
  }
}
