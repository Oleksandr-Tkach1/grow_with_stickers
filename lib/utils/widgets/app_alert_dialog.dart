import 'package:flutter/material.dart';
import 'package:grow_with_stickers/ui/screens/game/utils/animations/multi_ticker_provider.dart';
import 'package:grow_with_stickers/utils/ui/path_images.dart';
import 'package:grow_with_stickers/utils/widgets/app_button.dart';
import '../../utils/ui/colors.dart';
import '../personage_generation.dart';

class AppAlertDialog extends StatefulWidget {
  final String titleDialog;
  final String task;
  final String payload;
  final Function? onTap;

  const AppAlertDialog({super.key, required this.titleDialog, this.onTap, required this.task, required this.payload});

  @override
  State<StatefulWidget> createState() => AppAlertDialogState();
}

class AppAlertDialogState extends State<AppAlertDialog> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late MultiTickerProvider _multiTickerProvider;
  late String personage;

  @override
  void initState() {
    personage = generationPersonage();
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    _multiTickerProvider = MultiTickerProvider();
    _animationController = AnimationController(
      vsync: _multiTickerProvider,
      duration: const Duration(milliseconds: 300),
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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0XFFF27C5E),
                                Color(0XFFE25936),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0XFFFCFCFC),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                        child: Text(widget.titleDialog,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))),
                                    const SizedBox(height: 2),
                                    Text(widget.task,
                                        style: const TextStyle(
                                            color: Color(0XFFFFAA04),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    Center(
                                        child: Text(widget.payload,
                                            style: const TextStyle(
                                                color: Color(0XFFFFAA04),
                                                fontSize: 40,
                                                fontWeight: FontWeight.w900))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppButton(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          paddingAll: 8,
                          height: 56,
                          width: MediaQuery.of(context).size.width / 14.5,
                          onPressed: () => Navigator.pop(context),
                          pathImage: PathImages.closeButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(16),
            child: Image.asset(
              personage,
              width: 380,
              height: 380,
            ),
          ),
        ),
      ],
    );
  }
}