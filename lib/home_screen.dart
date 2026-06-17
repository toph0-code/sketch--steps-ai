import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/loomis_overlay.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  File? image;

  Future pickImage() async {
    final picked = await ImagePicker()
        .pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sketch Steps AI")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            image != null
                ? SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        Image.file(image!),
                        CustomPaint(
                          size: const Size(300, 300),
                          painter: LoomisOverlay(),
                        ),
                      ],
                    ),
                  )
                : const Text("No image selected"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Upload Photo"),
            ),
          ],
        ),
      ),
    );
  }
}
