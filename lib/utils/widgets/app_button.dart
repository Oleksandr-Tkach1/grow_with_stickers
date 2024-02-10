import 'package:flutter/material.dart';
import '../../utils/ui/colors.dart';

// ignore: constant_identifier_names
enum AppButtonType { GRADIENT, TRANSPORENT, OUTLINE }

class AppButton extends StatefulWidget {
  final double? width;
  final double? height;
  final double? border;
  final String? text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final bool? enable;
  final AppButtonType? type;
  final bool? withShadow;
  final Widget? child;
  final BorderRadius? borderRadius;
  final bool? disableOnlyUI;

  const AppButton({
    Key? key,
    this.width = double.infinity,
    this.height = 40,
    this.border = 2,
    this.onPressed,
    this.text,
    this.textColor,
    this.buttonColor,
    this.enable = true,
    this.type = AppButtonType.GRADIENT,
    this.withShadow = true,
    this.child,
    this.borderRadius,
    this.disableOnlyUI = false,
  })  : assert(
  (child != null && text == null) || (child == null && text != null)),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      color: widget.buttonColor ?? (widget.type == AppButtonType.GRADIENT ? AppColors.buttonColor : null),
      boxShadow: widget.withShadow! ? [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 8,
          offset: const Offset(0, 5),
        ),
      ]
          : null,
      border: widget.type == AppButtonType.TRANSPORENT
          ? Border.all(width: widget.border!, color: Colors.white)
          : Border.all(color: Colors.transparent),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
    );
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 50.0, minHeight: 42.0),
          alignment: Alignment.center,
          decoration: decoration,
          width: widget.width,
          height: widget.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              widget.child != null
                  ? widget.child!
                  : Text(
                widget.text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (widget.enable! && !widget.disableOnlyUI!)
                      ? (widget.textColor ??
                      (widget.type == AppButtonType.GRADIENT
                          ? Colors.white
                          : widget.type == AppButtonType.OUTLINE
                          ? Colors.white
                          :Colors.green))
                      : Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.enable! ? widget.onPressed! : () {},
                  borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(12),
                  splashColor: (!widget.enable! || widget.disableOnlyUI!)
                      ? Colors.transparent
                      : widget.type == AppButtonType.GRADIENT
                      ? Colors.white24
                      : Colors.grey,
                  highlightColor: (!widget.enable! || widget.disableOnlyUI!)
                      ? Colors.transparent
                      : widget.type == AppButtonType.GRADIENT
                      ? Colors.white24
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}