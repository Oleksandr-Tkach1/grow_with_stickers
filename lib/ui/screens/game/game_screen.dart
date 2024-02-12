import 'package:flutter/cupertino.dart';
import 'package:grow_with_stickers/ui/screens/game/widgets/stickers_menu.dart';
import '../game/widgets/navigation_drawer.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///TODO
        Center(child: Container(height: double.infinity, child: Image.asset('assets/images/game_screen.png', fit: BoxFit.fill))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationDrawer(onTapMenuButton: ()=> '', onTapExitButton: ()=> ''),
            StickersMenu(onTapNextButton: ()=> ''),
          ],
        ),
      ],
    );
  }
}