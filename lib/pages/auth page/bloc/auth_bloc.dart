import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailEvent>((event, emit) {
      emit(state.getEmailandPassword(email: event.email));
      print(state.email);
    });
    on<PasswordEvent>((event, emit) {
      
      emit(state.getEmailandPassword(password: event.password));
      print(state.password);
    });
    on<NewUsernameEvent>((event, emit) {
      emit(state.getEmailandPassword(newUserName: event.newUsername));
    });
    on<NewEmailEvent>((event, emit) {
      emit(state.getEmailandPassword(newEmail: event.newEmail));
      print(state.newEmail);
    });
    on<NewPasswordEvent>((event, emit) {
      emit(state.getEmailandPassword(newPassword: event.newPass));
      print(state.newPassword);
    });
  }
}
