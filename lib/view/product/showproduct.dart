import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

class ShoeProduct extends StatefulWidget {
  ShoeProduct(this.product_id, this.headingTitle, this.thumb, {Key? key}) : super(key: key);
  int product_id;
  String headingTitle;
  String thumb;

  @override
  State<ShoeProduct> createState() => _ShoeProductState();
}

class _ShoeProductState extends State<ShoeProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.headingTitle,
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: Center(
        child: PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.white),
          basePosition: Alignment.center,
          imageProvider: NetworkImage(
            widget.thumb,
          ),
        ),
      ),
    );
  }
}
