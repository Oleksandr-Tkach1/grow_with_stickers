import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_with_stickers/bloc/main_bloc/main_bloc.dart';
import 'package:grow_with_stickers/utils/ui/path_images.dart';
import 'package:grow_with_stickers/utils/widgets/app_button.dart';
import '../../../bloc/main_bloc/main_event.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(child: Container(width: double.infinity, child: Image.asset(PathImages.startScreenBackground, fit: BoxFit.fill))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: MediaQuery.of(context).size.height / 16),
                child: Wrap(
                  children: [
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child:
                        Image.asset(
                          PathImages.appLogo,
                        ),
                      ),
                    ),
                    Center(
                      child: AppButton(
                        height: 52,
                        width: MediaQuery.of(context).size.width / 2.3,
                        onPressed: ()=> BlocProvider.of<MainBloc>(context).add(Start()),
                        pathImage: PathImages.playButton,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}