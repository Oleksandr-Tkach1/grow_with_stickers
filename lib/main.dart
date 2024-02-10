import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_with_stickers/providers/providers.dart';
import 'package:grow_with_stickers/ui/screens/home/home_screen.dart';
import 'package:grow_with_stickers/ui/screens/splash/spalsh_screen.dart';
import 'package:grow_with_stickers/ui/screens/start/start_screen.dart';
import 'bloc/main_bloc/main_bloc.dart';
import 'bloc/main_bloc/main_state.dart';
import 'data/SQLite/SQLite_service.dart';
import 'data/SQLite/utils/model_mapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SqliteService sqliteService = SqliteService.instance;
  sqliteService.database;
  final ModelMapper modelMapper = ModelMapper();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  runApp(
      MultiRepositoryProvider(
          providers: getRepositories(sqliteService),
          child: MultiBlocProvider(providers: getProviders(sqliteService, modelMapper), child: const MyApp())
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Grow with stickers',
            theme: ThemeData(
              focusColor: Colors.grey,
              useMaterial3: true,
            ),
            home: navigateToHomeWidget(state),
          );
        }
    );
  }

  Widget navigateToHomeWidget(MainState state) {
    switch (state.status) {
      case AuthenticationStatus.loading:
        return const SplashScreen();
      case AuthenticationStatus.authenticated:
        return const HomeScreen();
      case AuthenticationStatus.unauthenticated:
        return const StartScreen();
      default: return const StartScreen();
    }
  }
}