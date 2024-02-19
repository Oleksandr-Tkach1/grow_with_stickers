import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_with_stickers/ui/screens/splash/cubit/splash_cubit.dart';
import '../bloc/main_bloc/main_bloc.dart';
import '../bloc/main_bloc/main_event.dart';
import '../data/repositories/book_repository.dart';
import '../ui/screens/home/cubit/home_cubit.dart';


getRepositories(sql, modelMapper, firebaseDatabase) {
  return [
    RepositoryProvider<BookRepositoryImpl>(create: (context) => BookRepositoryImpl(modelMapper, sql, firebaseDatabase)),
  ];
}

getProviders(sql, modelMapper, firebaseDatabase) {
  return [
    BlocProvider(create: (context) => MainBloc()..add(Started())),
    BlocProvider(create: (context) => SplashCubit(BookRepositoryImpl(sql, modelMapper, firebaseDatabase))),
    BlocProvider(create: (context) => HomeCubit(sql)),

  ];
}