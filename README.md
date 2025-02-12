# Image Picker Gallery

## Overview

The Image Picker Gallery is a Flutter application that allows users to select multiple images from their device's gallery and display them in a scrollable list view. The app also features a button to take pictures using the device's camera.

## What the Code Does

- **Image Selection**: Users can pick multiple images from their device's gallery using the "Pick Image" button.
- **Display Images**: The selected images are displayed in a ListView, allowing for easy scrolling through the gallery.
- **Camera Functionality**: Users can also take a photo using their device's camera, which can be saved to the gallery.

## How the Code Works

1. **Imports**:
   - The app imports necessary packages: `dart:io` for file handling, `flutter/material.dart` for UI components, `image_picker` for image selection, and `saver_gallery` for saving images.

2. **State Management**:
   - The main widget is a `StatefulWidget`, allowing the app to maintain the state of the selected images.

3. **UI Structure**:
   - The UI consists of an `AppBar`, a `ListView` for displaying images, an "Pick Image" button, and a `FloatingActionButton` for capturing images with the camera.
   - The `ListView.builder` dynamically creates a list of images based on the user's selections.

4. **Image Selection**:
   - When the "Pick Image" button is pressed, the app opens the device's gallery, allowing users to select multiple images.
   - Selected images are stored in a list, and the UI is updated to reflect these selections.

5. **Camera Functionality**:
   - The `FloatingActionButton` allows users to take a picture. The captured image is saved to the gallery and can be displayed in the list.

## Used Packages

1. **image_picker**
   - **Description**: A Flutter plugin for selecting images from the image library and taking new pictures with the camera.
   - **Link**: [image_picker](https://pub.dev/packages/image_picker)

2. **saver_gallery**
   - **Description**: A package for saving files to the device's gallery.
   - **Link**: [saver_gallery](https://pub.dev/packages/saver_gallery)
