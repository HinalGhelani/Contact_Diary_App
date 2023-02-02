import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class GlobalVar {

  static List<Map<String, dynamic>> contact = [];

  static GlobalKey<FormState> detail = GlobalKey<FormState>();
  static TextEditingController nameF = TextEditingController();
  static TextEditingController nameL = TextEditingController();
  static TextEditingController emailC = TextEditingController();
  static TextEditingController numberC = TextEditingController();
  static String Fname = "";
  static String Lname = "";
  static String number = "";
  static String email = "";
  static File? image;

  static List<XFile>? imageFileList = [];
  static bool mode = false;
}
