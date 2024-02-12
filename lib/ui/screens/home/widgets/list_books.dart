import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../game/game_screen.dart';

class ListBooks extends StatelessWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2, // Provide a fixed height or adjust as needed
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: 32),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(15),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 400),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: ()=> Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (_) => GameScreen(),
                    ),
                  ),
                  child: Container(
                    height: 85,
                    width: 125,
                    child: Image.asset(
                      'assets/images/book.png',
                      fit: BoxFit.cover, // Adjust the image fit as needed
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 18, // Adjust the itemCount as needed
      ),
    );
  }
}