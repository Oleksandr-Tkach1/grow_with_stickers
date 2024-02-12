import 'package:flutter/material.dart';
import '../../../../utils/ui/path_images.dart';
import '../../../../utils/widgets/app_button.dart';

class NavigationDrawer extends StatelessWidget {
  final Function onTapMenuButton;
  final Function onTapExitButton;
  const NavigationDrawer({super.key, required this.onTapMenuButton, required this.onTapExitButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Column(
                children: [
                  Center(
                    child: AppButton(
                      height: 56,
                      width: MediaQuery.of(context).size.width / 13,
                      onPressed: ()=> onTapMenuButton,
                      pathImage: PathImages.menuButton,
                    ),
                  ),
                  SizedBox(height: 14,),
                  Center(
                    child: AppButton(
                      height: 56,
                      width: MediaQuery.of(context).size.width / 13,
                      onPressed: ()=> onTapExitButton,
                      pathImage: PathImages.exitButton,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: AppButton(
              height: 56,
              width: MediaQuery.of(context).size.width / 13,
              onPressed: ()=> onTapExitButton,
              pathImage: PathImages.infoButton,
            ),
          ),
        ],
      ),
    );
  }
}