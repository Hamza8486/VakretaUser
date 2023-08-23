import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Chat',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
              '11:40 Pm',
              style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                BubbleSpecialThree(
                  isSender: true,
                  color: Colors.blue.shade100,
                  tail: true,
                  seen: true,
                  delivered: true,
                  text: 'Hey dear! How are you?'),
                    SizedBox(height: 5,),
                BubbleSpecialThree(
                  isSender: false,
                  color: Colors.grey.shade100,
                  tail: true,
                  seen: true,
                  delivered: true,
                  text: 'I am fine and you?'),
                   BubbleSpecialThree(
                  isSender: true,
                  color: Colors.blue.shade100,
                  tail: true,
                  seen: true,
                  delivered: true,
                  text: 'I am also fine '),
                    SizedBox(height: 5,),
                BubbleSpecialThree(
                  isSender: false,
                  color: Colors.grey.shade100,
                  tail: true,
                  seen: true,
                  delivered: true,
                  text: 'What are u doing?')
              ],
                    ),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [BoxShadow(
                 color: Colors.grey.shade300,
                 spreadRadius: 3,blurRadius: 5
               )]
             ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                        ),
                        fillColor: Colors.grey.shade50,
                        filled: true,
                        hintText: 'Enter message',
                        hintStyle: GoogleFonts.poppins(
                          textStyle:TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14
                          )
                        )
                      ),
                    )),
                    SizedBox(width: 10,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.send,color: Colors.white,size: 22,),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
        ]
      ),
    );
  }
}