part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class Trigger extends MainEvent {
  final int index;
  const Trigger(this.index) : super();
}
