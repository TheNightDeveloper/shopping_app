part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeDotsEvent extends HomeEvent {
  final int index;
  const HomeDotsEvent(this.index);
}
