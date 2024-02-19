import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:grow_with_stickers/ui/screens/home/cubit/home_state.dart';
import '../../game/game_screen.dart';

class ListBooks extends StatelessWidget {
  final HomeState state;
  const ListBooks({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
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
                  onTap: ()=> Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => GameScreen(book: state.listBooks[index],),
                    ),
                  ),
                  child: Container(
                    height: 85,
                    width: 125,
                    child: Image.network(
                      state.listBooks[index]!.coverUrl!,
                      fit: BoxFit.cover, // Adjust the image fit as needed
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: state.listBooks.length, // Adjust the itemCount as needed
      ),
    );
  }
}