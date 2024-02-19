import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AppButtonType { PLAT, STANDARD }

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? paddingAll;
  final BorderRadius? borderRadius;
  final String? pathImage;
  final VoidCallback? onPressed;
  final bool? enable;
  final AppButtonType? type;
  final bool? withShadow;

  const AppButton({
    Key? key,
    this.width = double.infinity,
    this.height = 40,
    this.paddingAll = 0,
    this.borderRadius,
    this.onPressed,
    this.pathImage,
    this.enable = true,
    this.type = AppButtonType.STANDARD,
    this.withShadow = true,
  })  : assert(
  (pathImage == null) || (pathImage != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(paddingAll!),
          constraints: BoxConstraints(minWidth: width ?? 60.0, minHeight: height ?? 52.0),
          alignment: Alignment.center,
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Material(
                borderRadius: borderRadius,
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: borderRadius,
                  onTap: onPressed!,
                  child: Ink.image(
                    image: AssetImage(pathImage!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}