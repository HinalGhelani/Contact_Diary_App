import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class GlobalVar {

  // static List name = [
  //   'Hinal',
  //   'ManishBhai',
  //   'Dipikaben',
  //   'Tirth',
  //   'Reetu',
  //   'Meet',
  //   'Hareshbhai',
  //   'Shilpaben',
  //   'Kashiben',
  //   'Ranchhodbhai'
  // ];

  static List<Map<String, dynamic>> contact = [
    // {
    //   'id': '1',
    //   'name': 'Hinal Ghelani',
    //   'number': "9876543218",
    //   'image': "9876543218",
    // },
    // {
    //   'id': '2',
    //   'name': 'Manish Ghelani',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '3',
    //   'name': 'Tirth Ghelani',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '4',
    //   'name': 'Dipika Ghelani',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '5',
    //   'name': 'Rohit Sharma',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '6',
    //   'name': 'Rohit Sharma',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '7',
    //   'name': 'Rohit Sharma',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '8',
    //   'name': 'Rohit Sharma',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '9',
    //   'name': 'Rohit Sharma',
    //   'number': "9876543218",
    // },
    // {
    //   'id': '10',
    //   'name': 'Rohit Sharma',
    //   'number': "9876543218",
    // },
  ];

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
