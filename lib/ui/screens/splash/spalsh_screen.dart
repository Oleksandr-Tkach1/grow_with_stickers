import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_with_stickers/utils/ui/path_images.dart';
import '../../../bloc/main_bloc/main_bloc.dart';
import '../../../bloc/main_bloc/main_event.dart';
import '../../../utils/widgets/app_progress_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), (){
      BlocProvider.of<MainBloc>(context).add(Loaded());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(child: Container(width: double.infinity, child: Image.asset('assets/images/splash.png', fit: BoxFit.fill))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: MediaQuery.of(context).size.height / 3.5),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 2,
                      child:
                      Image.asset(
                        PathImages.appLogo,
                      ),
                    ),
                  ),
                ),
                ProgressAnimationApp(indicator: Indicator.Wave,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}