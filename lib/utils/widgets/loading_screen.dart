import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';

class LoadingScreen extends StatelessWidget {
  final bool isLoading;

  final Widget child;
  final Color? backgroundColor;

  const LoadingScreen({
    super.key,
    required this.isLoading,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: backgroundColor ?? Colors.black54,
            alignment: Alignment.center,
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0.0, 20.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.secondary),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
