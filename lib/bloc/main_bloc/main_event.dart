import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent([List props = const []]);
}

class AppStarted extends MainEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'AppStarted';
}

class AppLoaded extends MainEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'AppLoaded';
}

class LoggedIn extends MainEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'LoggedIn';
}