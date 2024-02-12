import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(status: AuthenticationStatus.uninitialized)){
    on<Started>((event, emit) async{
      emit(state.copyWith(status: AuthenticationStatus.loading));
    });
    on<Loaded>((event, emit) async{
      emit(state.copyWith(status: AuthenticationStatus.uninitialized));
    });
    on<Start>((event, emit) async{
      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
      ));
    });
  }
}