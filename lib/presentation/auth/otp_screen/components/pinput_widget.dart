import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_fonts.dart';

class PinputWidget extends StatefulWidget {
  const PinputWidget({
    required this.onComplited,
    super.key,
  });

  final void Function(String pin) onComplited;

  @override
  State<PinputWidget> createState() => _PinputWidgetState();
}

class _PinputWidgetState extends State<PinputWidget> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: AppFonts.bodyLarge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 6,
            androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            defaultPinTheme: defaultPinTheme,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: widget.onComplited,
            followingPinTheme: defaultPinTheme,
            disabledPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: AppColors.main, width: 2),
            ),
            submittedPinTheme: defaultPinTheme,
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: AppColors.main),
            ),
          ),
        ),
      ],
    );
  }
}
