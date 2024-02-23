import 'package:flutter/material.dart';
import 'package:qr_and_barcode_scanner/ui/generate_qr_code.dart';
import 'package:qr_and_barcode_scanner/ui/scan_qr_code.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveBuilder(builder: (context, sizeInformation) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.09,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanQRCode(
                          isQrCode: true,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Scan QR Code',
                    style: TextStyle(
                      fontSize: 5.sw,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: size.height * 0.09,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenerateQRCode(),
                      ),
                    );
                  },
                  child: Text(
                    'Generate QR Code',
                    style: TextStyle(
                      fontSize: 4.sw,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: size.height * 0.09,
                width: size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanQRCode(
                          isQrCode: false,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Scan Barcode',
                    style: TextStyle(
                      fontSize: 5.sw,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
