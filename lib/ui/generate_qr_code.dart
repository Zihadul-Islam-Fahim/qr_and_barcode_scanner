import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height*0.1,
            ),
            SizedBox(

              width: size.width,
              child:   urlController.text.isNotEmpty ?Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: QrImageView(
                    data: urlController.text.trim(),
                    version: QrVersions.auto,
                    size: 80.screenWidth,
                    gapless: false,
                    errorStateBuilder: (cxt, err) {
                      return const Center(
                        child: Text(
                          'Uh oh! Something went wrong...',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ) : null,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              child: TextFormField(
                controller: urlController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Text to generate QR',
                    border: OutlineInputBorder()),
              ),
            ),

            SizedBox(
              height: size.height*0.05,
              width: size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() { });

                },
                child:  Text(
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
          ],
        ),
      ),
    ));
  }
}
