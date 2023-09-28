import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? selectedImage;

  void takeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    selectedImage = File(pickedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: takeImage,
      icon: const Icon(
        Icons.camera,
        color: Colors.black,
      ),
      label: const Text(
        'Click an Image',
        style: TextStyle(color: Colors.black),
      ),
    );

    if (selectedImage != null) {
      content = Image.file(
        selectedImage!,
        fit: BoxFit.cover,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(8),
          ),
        width: double.infinity,
        alignment: Alignment.center,
        child: content,
      ),
    );
  }
}
