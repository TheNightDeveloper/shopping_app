import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/pages/welcome_page/bloc/welcome_event.dart';
import 'package:shopping_app/pages/welcome_page/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
