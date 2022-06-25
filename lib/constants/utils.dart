import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';


void showSnackBar(BuildContext context, String text, {Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1250),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: color.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      content: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}


Future<List<File>> pickImages() async{
  List<File> images = [];

  try{
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if(files != null && files.files.isNotEmpty){
      for(int i = 0; i<files.files.length; i++){
        images.add(File(files.files[i].path!));
      }
    }
  }catch(e){
    debugPrint(e.toString());
  }
  return images;
}


