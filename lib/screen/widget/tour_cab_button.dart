
import 'package:flutter/material.dart';

import '../../constants/theme.dart';

enum ButtonState { initial, loading, disabled }

class CityCabButton extends StatelessWidget {
  final ButtonState? buttonState;
  final String? title;
  final Color color;
  final Color? textColor;
  final Color? disableColor;
  final void Function()? onTap;

  final Color? borderColor;

  const CityCabButton(
      {Key? key,
        this.buttonState,
        this.title,
        this.color = TourTheme.cityBlue,
        this.textColor,
        this.disableColor,
        this.onTap,
        this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = buttonState == ButtonState.loading;

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: buttonState == ButtonState.disabled ? null : onTap,
      child: Container(
        height: 49,
        constraints: const BoxConstraints(minWidth: 100),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: _getColour(),
          border: Border.all(
            color: (isLoading ? Colors.transparent : borderColor) ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Builder(builder: (_) {
          if (isLoading) {
            return Center(
              child: SizedBox(
                child: Transform.scale(
                    scale: 0.8,
                    child: const CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(TourTheme.cityWhite),
                    )),
              ),
            );
          }
          return Center(
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          );
        }),
      ),
    );
  }

  Color _getColour() {
    final isDisabled = buttonState == ButtonState.disabled;
    final isLoading = buttonState == ButtonState.loading;

    if (isDisabled) {
      return TourTheme.cityLightGrey;
    } else if (isLoading) {
      return TourTheme.cityBlue.withOpacity(.5);
    } else {
      return color;
    }
  }
}