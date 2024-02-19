import 'package:flutter/material.dart';
import '../../../../utils/ui/path_images.dart';
import '../../../../utils/widgets/app_button.dart';

class NavigationDrawer extends StatelessWidget {
  final Function onTapBackPageButton;
  final Function onTapMenuButton;
  final Function onTapExitButton;
  const NavigationDrawer({super.key, required this.onTapBackPageButton, required this.onTapMenuButton, required this.onTapExitButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Center(
            child: AppButton(
              height: 68,
              borderRadius: BorderRadius.only(topRight: Radius.circular(22), bottomRight: Radius.circular(22)),
              width: MediaQuery.of(context).size.width / 6.9,
              onPressed: () => onTapBackPageButton(),
              pathImage: PathImages.backButton,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 16),
          child: Container(
            height: MediaQuery.of(context).size.height -100,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: AppButton(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            paddingAll: 4,
                            height: 64,
                            width: MediaQuery.of(context).size.width / 13,
                            onPressed: ()=> onTapMenuButton(),
                            pathImage: PathImages.menuButton,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Center(
                          child: AppButton(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            paddingAll: 4,
                            height: 64,
                            width: MediaQuery.of(context).size.width / 13,
                            onPressed: ()=> onTapExitButton(),
                            pathImage: PathImages.exitButton,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: AppButton(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    paddingAll: 4,
                    height: 64,
                    width: MediaQuery.of(context).size.width / 13,
                    onPressed: ()=> onTapExitButton,
                    pathImage: PathImages.infoButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}