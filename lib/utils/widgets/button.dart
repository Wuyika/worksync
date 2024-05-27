import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.isLoading = false,
    required this.onPress,
    required this.buttonText,
    this.showIcon = true,
    this.backgroundButtonColor,
    this.buttonTextColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.buttonTextPadding,
  });

  final String buttonText;
  final bool isLoading;
  final void Function()? onPress;
  final bool showIcon;
  final MainAxisAlignment mainAxisAlignment;
  final Color? backgroundButtonColor;
  final Color? buttonTextColor;
  final double? buttonTextPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: onPress != null && (!isLoading)
            ? backgroundButtonColor ?? AppColors.secondary
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: isLoading ? null : onPress,
      child: isLoading
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            )
          : showIcon == false
              ? Text(
                buttonText,
                style: AppTypography.bodyMediumMedium.copyWith(
                  color: buttonTextColor ?? AppColors.white,
                ),
              )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      Text(
                        buttonText,
                        style: AppTypography.bodyMediumMedium.copyWith(
                          color: buttonTextColor ?? AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset(
                        Assets.appIcons.svg.lineArrowRight,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class PrimaryOutlinedButton extends StatelessWidget {
  const PrimaryOutlinedButton({
    super.key,
    this.buttonText,
    this.child,
    this.onPress,
    this.style,
  });

  final String? buttonText;
  final Widget? child;
  final ButtonStyle? style;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        side: const BorderSide(
          width: 1.5, // Set the border width here
          color: AppColors.secondary, // Set the border color here
        ),
      ),
      onPressed: onPress,
      child: Center(
        heightFactor: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: child ??
              Text(
                maxLines: 1,
                buttonText ?? '',
                style: AppTypography.bodyMediumMedium.copyWith(
                  color: AppColors.secondary,
                ),
              ),
        ),
      ),
    );
  }
}

class BouncingButton extends StatefulWidget {
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: ClipOval(
        child: Material(
          color: AppColors.primary, // Button color
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.5,
                color: Colors.transparent,
              ),
            ),
            child: InkWell(
              splashColor: Colors.red,
              child: const SizedBox(
                width: 56, // Button size
                height: 56,
                // child: Icon(Icons.camera_alt),
              ),
            ),
          ),
        ),
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
    );
  }
}
