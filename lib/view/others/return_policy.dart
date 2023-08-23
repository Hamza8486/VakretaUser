import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class ReturnPolicy extends StatefulWidget {
  ReturnPolicy(this.headingTitle, this.description, {Key? key}) : super(key: key);
  String headingTitle;

  String description;

  @override
  State<ReturnPolicy> createState() => _ReturnPolicy();
}

class _ReturnPolicy extends State<ReturnPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          widget.headingTitle,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Html(
          style: {'html': Style(textAlign: TextAlign.left)},
          data: widget.description,
        ),
      ),
    );
  }
}
