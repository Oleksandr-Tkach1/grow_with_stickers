import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(status: AuthenticationStatus.uninitialized)){
    on<AppStarted>((event, emit) async{
      emit(state.copyWith(status: AuthenticationStatus.loading));
    });
    on<AppLoaded>((event, emit) async{
      emit(state.copyWith(status: AuthenticationStatus.authenticated));
    });
    on<LoggedIn>((event, emit) async{
      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
      ));
    });
  }
}