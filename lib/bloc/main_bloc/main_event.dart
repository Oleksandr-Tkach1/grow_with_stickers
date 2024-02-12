import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent([List props = const []]);
}

class Started extends MainEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Started';
}

class Loaded extends MainEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Loaded';
}

class Start extends MainEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Start';
}