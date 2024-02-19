import 'package:bloc/bloc.dart';
import 'package:grow_with_stickers/data/SQLite/SQLite_service.dart';
import 'package:grow_with_stickers/ui/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SqliteService _sqliteService;
  HomeCubit(this._sqliteService) : super(const HomeState());

  getBooks() async{
    emit(state.copyWith(status: LoadingStatus.loading));
    _sqliteService.getBooks().then((value) {
      emit(state.copyWith(listBooks: value,
          status: value.isEmpty
              ? LoadingStatus.listIsEmpty
              : LoadingStatus.complete));
    });
  }
}