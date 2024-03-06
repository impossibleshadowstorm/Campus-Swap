import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MainApplicationController extends GetxController {






//   For Product

TextEditingController productTitle = TextEditingController();
TextEditingController productPrice = TextEditingController();
TextEditingController productCategory = TextEditingController();
TextEditingController productDescription = TextEditingController();









//      File Uploading Start 


PlatformFile? pickerFile;
UploadTask? uploadTask;

Future <String?> selectFile()async{

  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg','jpeg','png'],
    allowMultiple: false
  );

  if(result != null && result.files.isNotEmpty)
  {
    pickerFile = result.files.first;
    return pickerFile!.name;
  }
  else
  {
    return null;
  }

}

Future uploadFile()async{

  final file = File(pickerFile!.path!);

  final path = '/media/images${pickerFile!.name}';

  final ref = FirebaseStorage.instance.ref().child(path);

  ref.putFile(file);

  final snapshot = await uploadTask!.whenComplete((){});

  final url = await snapshot.ref.getDownloadURL();

  return url;
}










//      File Uploading End







}


