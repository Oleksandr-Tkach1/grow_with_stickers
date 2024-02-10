import 'package:flutter/material.dart';
import '../../utils/ui/colors.dart';

class AppAlertDialog {
  static AlertDialog createDialog(BuildContext context, String titleErrorMessage, String errorMessage, {VoidCallback? onYes, VoidCallback? onNo}) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      backgroundColor: AppColors.alertBackgroundColor,
      contentPadding: const EdgeInsets.only(top: 24),
      content: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  titleErrorMessage,
                  style: const TextStyle(color: const Color(0xFFF8F8F8), fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                height: 62,
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: const Color(0xFFE4E3E2), fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Divider(color: Colors.grey, height: 0),
              ),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8)),
                          onTap: () => onNo!(),
                          child: const Center(
                            child: Text("No", style: TextStyle(color: Color(0xFFE4E3E2), fontWeight: FontWeight.w700,), textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8)),
                          onTap: () => onYes!(),
                          child: const Center(
                            child: Text("Yes", style: TextStyle(color: Color(0xFFE4E3E2), fontWeight: FontWeight.w700,), textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}