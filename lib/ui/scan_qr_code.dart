import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQRCode extends StatefulWidget {
  final bool isQrCode;

  const ScanQRCode({super.key, required this.isQrCode});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  String qrResult = "Scanned data will appear here";

  void _onQrViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrResult = scanData.code!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: widget.isQrCode
                  ? const EdgeInsets.all(32.0)
                  : const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: QRView(key: qrKey, onQRViewCreated: _onQrViewCreated),
            )),
            SizedBox(
              height: size.height * 0.09,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  height: size.height * 0.1,
                  child: Text(
                    qrResult,
                    style: TextStyle(
                        fontSize: 3.7.sw, fontWeight: FontWeight.w200),
                    maxLines: 5,
                  )),
            ),
            SizedBox(
              height: size.height * 0.09,
            ),
            SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.5,
              child: ElevatedButton(
                onPressed: () async {
                  Clipboard.setData(ClipboardData(text: qrResult));
                },
                child: Text(
                  'Copy',
                  style: TextStyle(
                    fontSize: 4.sw,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.5,
              child: widget.isQrCode
                  ? ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(qrResult);
                        await launchUrl(url);
                      },
                      child: Text(
                        'Open',
                        style: TextStyle(
                          fontSize: 4.sw,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    qrController!.dispose();
    super.dispose();
  }
}
