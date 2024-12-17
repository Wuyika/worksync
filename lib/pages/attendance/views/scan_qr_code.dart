import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/permission_denied_dialog.dart';
import 'package:worklin/utils/qr_scan_overlay.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/button.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    useNewCameraSelector: true,
  );
  StreamSubscription<Object?>? _barcodeSubscription;

  void _handleBarcodeDetection(
      BarcodeCapture barcodeCapture,
      ) {
    final barcode = barcodeCapture.barcodes.firstOrNull?.rawValue;

    if (barcode != null) {
      HapticFeedback.vibrate();
    }
    AppNavigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    unawaited(controller.start());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Restart the camera when coming back to this page
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      unawaited(controller.start());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.hasCameraPermission) return;

    switch (state) {
      case AppLifecycleState.resumed:
        if (ModalRoute.of(context)?.isCurrent ?? false) {
          _startCamera();
        }
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        _stopCamera();
      default:
        break;
    }
  }

  void _startCamera() {
    unawaited(controller.start());
    _barcodeSubscription ??= controller.barcodes.listen(
            (barcodes) => _handleBarcodeDetection(barcodes),
      );
  }

  void _stopCamera() {
    unawaited(_barcodeSubscription?.cancel());
    _barcodeSubscription = null;
    unawaited(controller.stop());
    // unawaited(controller.dispose());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    unawaited(controller.dispose());
    super.dispose();
  }

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
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.55,
              child: _buildQrView(context),
            ),
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
                    onTap: () {
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

  Widget _buildQrView(BuildContext context) {

    return  Stack(
      children: [
        MobileScanner(
          controller: controller,
          overlayBuilder: (context, constraints) {
            return buildScanOverlay(context);
          },
          errorBuilder: (context, error, child) {
            if (error.errorCode ==
                MobileScannerErrorCode.permissionDenied) {
              return PermissionDeniedDialog(
                permissionMessage:
                LocaleKeys.cameraPermissionError.tr(),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('${error.errorDetails?.message}'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
