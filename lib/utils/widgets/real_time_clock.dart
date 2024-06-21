import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helper_classes.dart';
import 'package:worklin/utils/typography.dart';

class RealTimeClock extends StatefulWidget {
  const RealTimeClock({super.key});

  @override
  State<RealTimeClock> createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  String _timeString = '';
  late Timer timer;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if(context.mounted){
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm:ss a').format(dateTime);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GradientText(
      text: _timeString,
      style: AppTypography.bodyLargeRegular.copyWith(
        fontSize: 28,
        fontWeight: AppTypography.weightBold,
      ),
      gradient: const LinearGradient(
        colors: [
          AppColors.secondary, // Your provided color code
          Colors.purple, // Generic purple color
        ],
      ),
    );
  }
}
