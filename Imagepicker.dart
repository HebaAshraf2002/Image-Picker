// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:saver_gallery/saver_gallery.dart';

// class Imagepicker extends StatefulWidget {
//   const Imagepicker({super.key});

//   @override
//   State<Imagepicker> createState() => _ImagepickerState();
// }

// class _ImagepickerState extends State<Imagepicker> {
//   File? imageFile;
//   final ImagePicker _picker = ImagePicker();

// Future<void> _captureImage() async {
//   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//   if (photo != null) {
//     File image = File(photo.path);
//     setState(() {
//       imageFile = image;
//     });

//       await SaverGallery.saveFile(
//           filePath: photo.path, fileName: photo.name, skipIfExists: true);

//       // Save to gallery
//       // final result = await ImageGallerySaver.saveFile(photo.path);
//       // if (result['isSuccess']) {
//       //   ScaffoldMessenger.of(context).showSnackBar(
//       //     SnackBar(content: Text("Image saved to gallery!")),
//       //   );
//       // }
//     }
//   }

//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         imageFile = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Picker"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (imageFile != null)
//             SizedBox(
//               height: 200,
//               width: 200,
//               child: Image.file(imageFile!),
//             ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _captureImage,
//             child: Text("Camera"),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _pickImage,
//             child: Text("Gallery"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saver_gallery/saver_gallery.dart'; // لحفظ الصور في المعرض

class Imagepicker extends StatefulWidget {
  const Imagepicker({super.key});

  @override
  State<Imagepicker> createState() => _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {
  final ImagePicker _picker = ImagePicker();
  List<File> _imageFiles = []; // قائمة لتخزين الصور المحددة

  // دالة لالتقاط صورة من الكاميرا
  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        // _imageFiles.add(File(photo.path)); // إضافة الصورة إلى القائمة
      });
      await SaverGallery.saveFile(
          filePath: photo.path,
          fileName: photo.name,
          skipIfExists: true); // حفظ الصورة في المعرض
    }
  }

  // دالة لاختيار صور متعددة من المعرض
  Future<void> _pickImages() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();
    if (pickedImages != null) {
      setState(() {
        _imageFiles = pickedImages.map((e) => File(e.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery App"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // ListView لعرض الصور المحددة
          Expanded(
            child: ListView.builder(
              itemCount: _imageFiles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    _imageFiles[index],
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // زر لالتقاط صورة من الكاميرا
          ElevatedButton(
            onPressed: _takePhoto,
            child: Text("Take Photo"),
            style: ElevatedButton.styleFrom(
              // لون الزر
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          SizedBox(height: 10),
          // زر لاختيار صور من المعرض
          ElevatedButton(
            onPressed: _pickImages,
            child: Text("Pick Images"),
            style: ElevatedButton.styleFrom(
              // لون الزر
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
