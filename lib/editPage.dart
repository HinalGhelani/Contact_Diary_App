import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'GlobalVar.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  clearimage() {
    setState(() {
      GlobalVar.image = null;
    });
  }

  getImage() async {
    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.camera);
    if (pic != null) {
      setState(() {
        GlobalVar.image = File(pic.path);
      });
    }
  }


  setImage() async {
    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pic != null) {
      setState(() {
        GlobalVar.image = File(pic.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: const Text(
          "Edit Contact",
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
        actions: [
          IconButton(
              onPressed: () async {

                setState(() {
                  if (GlobalVar.detail.currentState!.validate()) {
                    GlobalVar.detail.currentState!.save();
                  }
                  GlobalVar.contact.add({
                    'image': GlobalVar.image,
                    'Fname': GlobalVar.Fname,
                    'Lname': GlobalVar.Lname,
                    'number': GlobalVar.number,
                  });

                  // GlobalVar.detail.currentState!.reset();
                  GlobalVar.nameF.clear();
                  GlobalVar.nameL.clear();
                  GlobalVar.emailC.clear();
                  GlobalVar.numberC.clear();
                  GlobalVar.image=null;
                  GlobalVar.Fname = '';
                  GlobalVar.Lname = '';
                  GlobalVar.email = '';
                  GlobalVar.number = '';
                });
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(
                Icons.done,
                color: Colors.black87,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  clearimage();
                });
              },
              icon: const Icon(Icons.clear,color: Colors.black,))
        ],
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                (GlobalVar.image == null)
                    ? CircleAvatar(
                        maxRadius: 60,
                        backgroundColor: Colors.grey.shade400,
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade400,
                        backgroundImage: Image.file(
                          GlobalVar.image!,
                          fit: BoxFit.cover,
                        ).image,
                      ),
                Align(
                  alignment: const Alignment(0.3, 0.3),
                  child: SizedBox(
                    height: 25,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                getImage();
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: const Text(
                                              "Camera",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.indigo),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                setImage();
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: const Text(
                                              "Gallery",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.indigo),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: GlobalVar.detail,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "First Name",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      width: 350,
                      child: TextFormField(
                        controller: GlobalVar.nameF,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter this';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            GlobalVar.Fname = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Name"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Last Name",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      width: 350,
                      child: TextFormField(
                        controller: GlobalVar.nameL,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter this';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            GlobalVar.Lname = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Last Name"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      width: 350,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: GlobalVar.numberC,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter this';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            GlobalVar.number = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "+91 "),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      width: 350,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: GlobalVar.emailC,
                        onChanged: (val) {
                          setState(() {
                            GlobalVar.email = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "@gmail.com"),
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
