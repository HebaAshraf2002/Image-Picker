import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saver_gallery/saver_gallery.dart';

class ImagePickerGallery extends StatefulWidget {
  const ImagePickerGallery({super.key});

  @override
  State<ImagePickerGallery> createState() => _ImagePickerGalleryState();
}

class _ImagePickerGalleryState extends State<ImagePickerGallery> {
  final ImagePicker imagePicker = ImagePicker();
  List<File> imagesFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Image Picker Gallery',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: imagesFiles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.file(
                      imagesFiles[index],
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () async {
                final List<XFile> photos = await imagePicker.pickMultiImage();
                if (photos != null) {
                  setState(() {
                    imagesFiles = photos.map((e) => File(e.path)).toList();
                  });
                }
              },
              child: Text(
                'Pick Image',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () async {
              final XFile? image =
                  await imagePicker.pickImage(source: ImageSource.camera);
              if (image != null) {
                setState(() {});
                await SaverGallery.saveFile(
                    filePath: image.path,
                    fileName: image.name,
                    skipIfExists: true);
              }
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            )));
  }
}
