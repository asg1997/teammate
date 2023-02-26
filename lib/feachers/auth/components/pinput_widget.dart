import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:teammate/core/consts/app_colors.dart';

class PinputWidget extends StatefulWidget {
  const PinputWidget({Key? key, required this.onComplited}) : super(key: key);

  final Function(String pin) onComplited;

  @override
  State<PinputWidget> createState() => _PinputWidgetState();
}

class _PinputWidgetState extends State<PinputWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: widget.onComplited,
              followingPinTheme: defaultPinTheme,
              disabledPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme,
              submittedPinTheme: defaultPinTheme,
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: AppColors.main),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
