import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? _imageFile;

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    print('build -- $_imageFile');
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('混合开发'),
          ),
          body: Center(
            child: (_imageFile==null?Text('data'):Image.file(_imageFile!)),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed: pickImage,
          ),
        ),
    );
  }

  void pickImage() async{
    /// ImageSource.camera: 拍照获取图片  ImageSource.gallery: 手机选择图库
    PickedFile? file = await picker.getImage(source: ImageSource.gallery,maxWidth: 300);
    setState(() {
      print('file - $file');
      if (file != null) {
        _imageFile = File(file.path);
      }
    });
  }

}

