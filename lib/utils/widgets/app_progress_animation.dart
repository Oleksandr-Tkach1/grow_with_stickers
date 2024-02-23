import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum Indicator {Wave, FoldingCube}

class ProgressAnimationApp extends StatefulWidget {
  ProgressAnimationApp({Key? key, required this.indicator, required this.color}) : super(key: key);
  final Color color;
  final Indicator indicator;

  @override
  State<ProgressAnimationApp> createState() => _ProgressAnimationAppState();
}

class _ProgressAnimationAppState extends State<ProgressAnimationApp> {
  @override
  Widget build(BuildContext context) {
    return widget.indicator == Indicator.Wave ? SpinKitWave(
      size: 24,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: widget.color,
          ),
        );
      },
    ) : SpinKitFoldingCube(
      size: 24,
      itemBuilder: (BuildContext context, int index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white
          ),
        );
      },
    );
  }
}