import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/main_bloc/main_bloc.dart';
import '../bloc/main_bloc/main_event.dart';
import '../data/repositories/main_repository.dart';


getRepositories(sql, firebaseDatabase) {
  return [
    RepositoryProvider<CardRepository>(create: (context) => CardRepository(sql, firebaseDatabase)),
  ];
}

getProviders(sql, modelMapper) {
  return [
    BlocProvider(create: (context) => MainBloc()..add(Started())),
  ];
}