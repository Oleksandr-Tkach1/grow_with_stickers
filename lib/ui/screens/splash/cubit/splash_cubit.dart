import 'package:bloc/bloc.dart';
import 'package:grow_with_stickers/data/repositories/book_repository.dart';
import 'package:grow_with_stickers/ui/screens/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final BookRepositoryImpl _mainRepository;
  SplashCubit(this._mainRepository) : super(const SplashState());

  getBooks() async{
    emit(state.copyWith(status: LoadingStatus.loading));
    await _mainRepository.fetchBooks();
    emit(state.copyWith(status: LoadingStatus.complete));
  }
}