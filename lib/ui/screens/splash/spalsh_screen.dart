import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/main_bloc/main_bloc.dart';
import '../../../bloc/main_bloc/main_event.dart';
import '../../../utils/ui/colors.dart';
import '../../../utils/widgets/app_progress_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      BlocProvider.of<MainBloc>(context).add(AppLoaded());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.backgroundTopLeftGradient,
            AppColors.backgroundBottomRightGradient,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 38.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 14, vertical: MediaQuery.of(context).size.height / 3.5),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width / 2,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              ProgressAnimationApp(indicator: Indicator.Wave,)
            ],
          ),
        ),
      ),
    );
  }
}