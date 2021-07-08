import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class adddata extends StatefulWidget {
  const adddata({Key? key}) : super(key: key);

  @override
  _adddataState createState() => _adddataState();
}

class _adddataState extends State<adddata> {
  File? file;
  final ImagePicker picker = ImagePicker();
  Future<Null> chooseImage(ImageSource imageSource) async {
    try {
      var object = await picker.getImage(
          source: imageSource, maxHeight: 600.0, maxWidth: 600.0);

      setState(() {
        file = File(object!.path);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มข้อมูล'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(top: 10), child: Text('รหัส')),
            Container(
              margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 20),
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รหัสวัว',
                ),
              ),
            ),
            Column(
              children: [
                Text('ประเภท'),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 20),
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ประเภทวัว',
                    ),
                  ),
                ),
                Text('เพศ'),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 20),
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'เพศ',
                    ),
                  ),
                ),
                Text('อายุ'),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 20),
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ป/ด/ว',
                    ),
                  ),
                ),
                Text('วันที่ฉีดวัคซีน'),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 20),
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ว/ด/ป',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 36.0,
                      ),
                      onPressed: () => chooseImage(ImageSource.camera),
                    ),
                    Container(
                      width: 250.0,
                      child: file == null
                          ? Image.asset('assets/images/addata.png')
                          : Image.file(file!),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_photo_alternate,
                        size: 36.0,
                      ),
                      onPressed: () => chooseImage(ImageSource.gallery),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, right: 20, left: 20),
                      primary: Colors.black,
                      textStyle: TextStyle(fontSize: 16),
                      backgroundColor: Colors.lightGreenAccent[400],
                    ),
                    onPressed: () {
                      print("you win");
                    },
                    child: Text('บันทึกข้อมูล'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
