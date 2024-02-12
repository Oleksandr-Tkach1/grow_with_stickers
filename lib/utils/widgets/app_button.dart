import 'package:flutter/material.dart';
import '../../utils/ui/colors.dart';

// ignore: constant_identifier_names
enum AppButtonType { PLAT, STANDARD }

class AppButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? pathImage;
  final VoidCallback? onPressed;
  final bool? enable;
  final AppButtonType? type;
  final bool? withShadow;

  const AppButton({
    Key? key,
    this.width = double.infinity,
    this.height = 40,
    this.onPressed,
    this.pathImage,
    this.enable = true,
    this.type = AppButtonType.STANDARD,
    this.withShadow = true,
  })  : assert(
  (pathImage == null) || (pathImage != null)),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(minWidth: widget.width ?? 60.0, minHeight: widget.height ?? 52.0),
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap:widget.onPressed!,
                  child: Ink.image(
                    image: AssetImage(widget.pathImage!),
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