import 'package:flutter/material.dart';
import 'package:imagepicker/ImagePickerGallery.dart';
import 'package:imagepicker/Imagepicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImagePickerGallery(),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerGallery extends StatefulWidget {
//   const ImagePickerGallery({super.key});

//   @override
//   State<ImagePickerGallery> createState() => _ImagePickerGalleryState();
// }

// class _ImagePickerGalleryState extends State<ImagePickerGallery> {
//   final ImagePicker _picker = ImagePicker();
//   List<File> _imageFiles = []; // List to store selected images

//   // Function to pick multiple images
//   Future<void> _pickImages() async {
//     final List<XFile>? pickedImages = await _picker.pickMultiImage();
//     if (pickedImages != null) {
//       setState(() {
//         _imageFiles = pickedImages.map((e) => File(e.path)).toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Gallery App"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           // ListView to display selected images
//           Expanded(
//             child: ListView.builder(
//               itemCount: _imageFiles.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.file(
//                     _imageFiles[index],
//                     width: 150,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 20),
//           // Button to pick images from the gallery
//           ElevatedButton(
//             onPressed: _pickImages,
//             child: Text("Pick Images"),
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             ),
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
