import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Theme/color.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? pickedImage;

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxHeight: 150);
    setState(() {
      if (pickedImageFile != null) {
        pickedImage = File(pickedImageFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        width: 150,
        height: 300,
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: ReturnColor('blue'),
              backgroundImage:
                  pickedImage != null ? FileImage(pickedImage!) : null,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  _pickImage();
                },
                icon: Icon(Icons.image),
                label: Text('Add icon')),
            const SizedBox(
              height: 80,
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                label: Text('Close'))
          ],
        ));
  }
}
