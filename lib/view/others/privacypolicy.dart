import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/services/apiservice.dart';

class PP extends StatefulWidget {
  const PP({Key? key}) : super(key: key);

  @override
  State<PP> createState() => _PPState();
}

class _PPState extends State<PP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ApiService().getPrivacyPolicy(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(height: 30,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15),
                    //   child: Html(
                    //     data:snapshot.data['heading_title']
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child:Html(
                          data:snapshot.data['description']
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}