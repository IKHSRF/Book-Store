import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class StorageServices {
  static FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static ImagePicker _picker = ImagePicker();

  static Future<String> uploadImage(File imageFile) async {
    try {
      String filename = basename(imageFile.path);
      Reference ref = _firebaseStorage.ref().child(filename);
      Task task = ref.putFile(imageFile);
      TaskSnapshot taskSnapshot = await task;

      return await taskSnapshot.ref.getDownloadURL();
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<File> getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    return File(pickedFile.path);
  }
}
