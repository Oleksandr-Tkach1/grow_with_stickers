import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_with_stickers/ui/screens/home/cubit/home_cubit.dart';
import 'package:grow_with_stickers/ui/screens/home/cubit/home_state.dart';
import 'package:grow_with_stickers/ui/screens/home/widgets/categories.dart';
import 'package:grow_with_stickers/ui/screens/home/widgets/list_books.dart';
import 'package:grow_with_stickers/ui/screens/home/widgets/top_bar.dart';
import 'package:grow_with_stickers/ui/screens/settings/settings_screen.dart';
import 'package:grow_with_stickers/utils/ui/path_images.dart';

import '../../../utils/widgets/app_progress_animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final HomeCubit _cubit;
    _cubit = BlocProvider.of<HomeCubit>(context);
    _cubit.getBooks();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);
          if (orientation == Orientation.portrait) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeLeft,
            ]);
          }
            return BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state){
                ///TODO
              },
              builder: (context, state){
                return Stack(
                  children: [
                    Center(child: Container(height: double.infinity, child: Image.asset(PathImages.homeScreenBackground, fit: BoxFit.fill))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopBar(onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SettingsScreen(),
                        )),),
                        state.status == LoadingStatus.loading ? Center(child: ProgressAnimationApp(indicator: Indicator.Wave, color: Colors.white,),) :
                        ListBooks(state: state),
                        Categories(),
                      ],
                    ),
                  ],
                );
              },
            );
        }
      ),
    );
  }
}