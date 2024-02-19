import 'package:flutter/material.dart';
import 'package:grow_with_stickers/utils/ui/path_images.dart';
import '../../../../utils/widgets/app_button.dart';

class TopBar extends StatelessWidget {
  final Function onTap;
  const TopBar({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(padding: const EdgeInsets.only(left: 12.0),),
          Center(
            child: SizedBox(
              width: 172,
              child:
              Image.asset(
                PathImages.appLogo,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AppButton(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                paddingAll: 4,
                height: 64,
                width: MediaQuery.of(context).size.width / 13,
                onPressed: ()=> onTap(),
                pathImage: PathImages.settingsButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
