import 'package:equatable/equatable.dart';
import 'package:grow_with_stickers/data/SQLite/entity/book_entity.dart';

enum LoadingStatus { initial, error, complete, loading, listIsEmpty }

class HomeState extends Equatable {
  final LoadingStatus status;
  final List<BookEntity?> listBooks;

  const HomeState({
    this.status = LoadingStatus.initial,
    this.listBooks = const [],
  });

  HomeState copyWith({
    LoadingStatus? status,
    List<BookEntity?>? listBooks,
  }) {
    return HomeState(
      status: status ?? this.status,
      listBooks: listBooks ?? this.listBooks,
    );
  }

  @override
  List<Object> get props => [
    status,
    listBooks ?? ''
  ];
}