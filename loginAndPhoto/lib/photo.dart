import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LearnFlutterPage extends StatefulWidget {
  LearnFlutterPage({super.key});
  State<LearnFlutterPage> createState() => _LearnFlutterPage();
}

class _LearnFlutterPage extends State<LearnFlutterPage> {
  File? file;
  ImagePicker image = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picture page  "),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 140,
              width: 180,
              color: Colors.black12,
              child: file == null
                  ? Icon(
                      Icons.image,
                      size: 50,
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
            ),
            MaterialButton(
              onPressed: () {
                getgall();
              },
              color: Colors.blue[900],
              child: Text(
                "take from gallery",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                getcam();
              },
              color: Colors.blue[900],
              child: Text(
                "take from camera",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      // file = File(img!.path);
      //cornHelth.jpg

      file = File(img!.path);
    });
  }
}
