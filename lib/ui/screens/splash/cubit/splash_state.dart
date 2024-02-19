import 'package:equatable/equatable.dart';

enum LoadingStatus { initial, loading, complete }

class SplashState extends Equatable {
  final LoadingStatus status;

  const SplashState({
    this.status = LoadingStatus.initial,
  });

  SplashState copyWith({
    LoadingStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}