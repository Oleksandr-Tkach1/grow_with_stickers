import 'package:equatable/equatable.dart';

enum AuthenticationStatus{ uninitialized, loading, authenticated, unauthenticated }

class MainState extends Equatable {

  const MainState({
    this.token = '',
    this.status = AuthenticationStatus.uninitialized,
    this.signature = 0,
  });

  final AuthenticationStatus status;
  final String token;
  final int signature;

  MainState copyWith({
    AuthenticationStatus? status,
    String? token,
    String? deepLinkEmail,
    String? deepLinkConfirmCode,
    int? signature,
  }) {
    return MainState(
      signature: signature ?? this.signature,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [signature, status, token];
}