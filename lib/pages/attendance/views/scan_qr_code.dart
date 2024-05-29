import 'package:flutter/material.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/button.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          "Scan QR Code",
          style: AppTypography.headingH2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: AppColors.secondary.withOpacity(0.1),
                  onTap: () {
                    AppNavigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "Cancel",
                      style: AppTypography.bodyLargeMedium,
                    ),
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 6,
                      color: AppColors.secondary,
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      AppNavigator.pop(context, true);
                    },
                    child: BouncingButton(),
                  ),
                ),
                InkWell(
                  splashColor: AppColors.secondary.withOpacity(0.1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "Retake",
                      style: AppTypography.bodyLargeMedium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
