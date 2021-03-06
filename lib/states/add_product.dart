import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungeasyshop/models/stock_model.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_logo.dart';
import 'package:ungeasyshop/widgets/show_svg.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class AddProduct extends StatefulWidget {
  final StockModel stockModel;
  const AddProduct({Key? key, required this.stockModel}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  StockModel? stockModel;

  File? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stockModel = widget.stockModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: Text('เพิ่มสินค้า ในกล่ม ${stockModel!.cat}'),
      ),
      body: Column(
        children: [
          buildImage(),
          buildName(),
          buildStock(),
          buildSave(),
        ],
      ),
    );
  }

  Container buildSave() {
    return Container(
      width: 250,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Save'),
        style: MyConstant().myButtonStyle(),
      ),
    );
  }

  Container buildName() {
    return Container(
      width: 250,
      child: TextFormField(
        decoration: const InputDecoration(
          label: ShowText(title: 'ชื่อสินค้า'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildStock() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: ShowText(title: 'จำนวนสินค้า'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> processTakePhoto(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .pickImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () =>processTakePhoto(ImageSource.camera),
          icon: const Icon(Icons.add_a_photo),
        ),
        Container(
          width: 150,
          height: 150,
          child: file == null ? const ShowImage() : Image.file(file!) ,
        ),
        IconButton(
          onPressed: () =>processTakePhoto(ImageSource.gallery),
          icon: const Icon(Icons.add_photo_alternate),
        ),
      ],
    );
  }
}
