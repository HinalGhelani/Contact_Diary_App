import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'GlobalVar.dart';
import 'editPage.dart';


void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatefulWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  State<ContactApp> createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  var alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: (GlobalVar.mode == false) ? ThemeMode.dark : ThemeMode.light,
      darkTheme: (GlobalVar.mode == false)
          ? ThemeData(brightness: Brightness.dark)
          : ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      routes: {
        'editPage': (context) => const EditPage(),
        '/': (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: (GlobalVar.mode == false)
                    ? Colors.grey.shade700
                    : Colors.white,
                title: const Text(
                  "Contacts",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                elevation: 0,
                actions: [
                  Row(
                    children: [
                      (GlobalVar.mode)
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  GlobalVar.mode = !GlobalVar.mode;
                                });
                              },
                              child: const Icon(Icons.circle,
                                  color: Colors.black, size: 30))
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  GlobalVar.mode = !GlobalVar.mode;
                                });
                              },
                              child: const Icon(Icons.circle,
                                  color: Colors.white, size: 30)),
                      const Icon(Icons.more_vert,
                          color: Colors.black87, size: 30),
                    ],
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, 'editPage');
                  });
                },
                backgroundColor: Colors.grey.shade700,
                child: const Icon(Icons.add, size: 30),
              ),
              body: (GlobalVar.contact.isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.contact_page_outlined,
                            size: 80,
                          ),
                          Text(
                            "No Contact",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                          children: GlobalVar.contact.map((e) {
                        return SizedBox(
                          height: 70,
                          child: GestureDetector(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Delete"),
                                      content: const Text(
                                          "Are you sure delete this contact?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            "CANCEL",
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              GlobalVar.contact.remove(e);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            "OK",
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle
                                ),
                                child: (e['image']  == null) ?
                                TextAvatar(
                                  textColor: Colors.white,
                                  fontSize: 20,
                                  shape: Shape.Circular,
                                  text: "${e['Fname'][0]}${e['Lname'][0]}",
                                  upperCase: true,
                                  // numberLetters: 2,
                                ): CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: Image.file(
                                    // GlobalVar.image!,
                                    e['image'],
                                    fit: BoxFit.cover,
                                  ).image,
                                ),
                              ),
                              title: Text(
                                "${e['Fname']} ${e['Lname']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              subtitle: Text(
                                "+91 ${e['number']}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                    ),

            ),
      },
    );
  }
}

