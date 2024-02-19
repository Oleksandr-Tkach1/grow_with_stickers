import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:grow_with_stickers/data/SQLite/entity/book_entity.dart';
import '../../../../utils/ui/path_images.dart';
import '../../../../utils/widgets/app_button.dart';

class StickersMenu extends StatelessWidget {
  final Function onTapNextPageButton;
  final BookEntity? book;
  const StickersMenu({Key? key, required this.onTapNextPageButton, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: AppButton(
              height: 68,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(22), bottomLeft: Radius.circular(22)),
              width: MediaQuery.of(context).size.width / 6.9,
              onPressed: () => onTapNextPageButton(),
              pathImage: PathImages.nextButton,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.height -84,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0XFFFEC203), width: 6.5),
                  left: BorderSide(color: Color(0XFFFEC203), width: 6.5),
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(19.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                      ),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(height: 4),
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(15),
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 250),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 4,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Image.network(
                                    book!.sticker![index].coverUrl,
                                    fit: BoxFit.cover, // Adjust the image fit as needed
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: book!.sticker!.length, // Adjust the itemCount as needed
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}