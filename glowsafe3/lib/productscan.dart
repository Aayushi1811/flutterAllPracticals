import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProductScanPage extends StatefulWidget {
  @override
  _ProductScanPageState createState() => _ProductScanPageState();
}

class _ProductScanPageState extends State<ProductScanPage> {
  File? _image; // To hold the image file
  final ImagePicker _picker = ImagePicker(); // Image picker instance

  // Function to capture an image using the camera
  Future<void> _captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update image state
      });
      _sendImageToLandingAI(_image!); // Send the image to Landing.ai
    }
  }

  // Function to upload an image from files
  Future<void> _uploadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update image state
      });
      _sendImageToLandingAI(_image!); // Send the image to Landing.ai
    }
  }

  // Function to send image to Landing.ai API
  Future<void> _sendImageToLandingAI(File imageFile) async {
    final url = 'https://app.landing.ai/product_scan';
    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll({
        'Authorization': 'Bearer land_sk_yauRbMP7HezO4Xil39SZ9N63R5TBwST4pDg5pj7iw3iStOpzve',
      })
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Image sent successfully!');
      // Handle successful response (e.g., display results)
    } else {
      print('Failed to send image. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan Product')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected image if it exists
            if (_image != null)
              Image.file(
                _image!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              )
            else
              Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.camera),
              label: Text('Capture Image'),
              onPressed: _captureImage,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.upload_file),
              label: Text('Upload Image'),
              onPressed: _uploadImage,
            ),
          ],
        ),
      ),
    );
  }
}
