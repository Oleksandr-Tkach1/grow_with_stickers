import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grow_with_stickers/data/SQLite/entity/book_entity.dart';
import 'package:grow_with_stickers/ui/screens/game/utils/animations/multi_ticker_provider.dart';
import 'package:grow_with_stickers/ui/screens/game/widgets/stickers_menu.dart';
import 'package:grow_with_stickers/utils/personage_generation.dart';
import 'package:grow_with_stickers/utils/widgets/app_alert_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../game/widgets/navigation_drawer.dart' as appNavigationDrawer;

class GameScreen extends StatefulWidget {
  final BookEntity? book;

  const GameScreen({super.key, required this.book});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  late PageController _controller;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late MultiTickerProvider _multiTickerProvider;
  late int indexPage;

  @override
  void initState() {
    _controller = PageController(viewportFraction: 8.0, initialPage: 0);

    _multiTickerProvider = MultiTickerProvider();
    _animationController = AnimationController(
      vsync: _multiTickerProvider,
      duration: const Duration(milliseconds: 700),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.63, 1.0), // Start from the left bottom side
      end: const Offset(-0.63, 0.3),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: PageView.builder(
              itemCount: widget.book!.page!.length,
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemBuilder: (context, index) {
                indexPage = index;
                return Center(
                child: CachedNetworkImage(
                imageUrl: widget.book!.page![index].backgroundUrl!,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: const Color(0xFFEAE5EE))),
                errorWidget: (context, url, error) => const Icon(Icons.error_outline, size: 30, color: Colors.grey,),
                ),
                );
              }
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: _controller,
              count: widget.book!.page!.length,
              effect: ExpandingDotsEffect( activeDotColor: Colors.white, dotColor: Colors.white, dotHeight: 8, dotWidth: 8),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appNavigationDrawer.NavigationDrawer(
                onTapBackPageButton: () => _controller.previousPage(
                    duration: Duration(milliseconds: 650), curve: Curves.ease),
                onTapMenuButton: () => Navigator.pop(context),
                onTapExitButton: () => Navigator.pop(context)),
            StickersMenu(
                // onTapNextPageButton: () => _controller.nextPage(
                //     duration: Duration(milliseconds: 650), curve: Curves.ease),
                onTapNextPageButton: () => showWaitingDialog(context),
                book: widget.book),
          ],
        ),
        SlideTransition(
          position: _slideAnimation,
          child: Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(16),
            child: Image.asset(
              // 'assets/images/wolf1.png',
              generationPersonage(),
              width: 380,
              height: 380,
            ),
          ),
        ),
      ],
    );
  }
  void showWaitingDialog(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        barrierColor: Colors.black.withOpacity(0.6),
        opaque: false,
        pageBuilder: (context, _, __) => AppAlertDialog(titleDialog: widget.book!.page![indexPage].title!, task: widget.book!.page![indexPage].task!, payload:  widget.book!.page![indexPage].payload!),
      ),
    );
  }
}