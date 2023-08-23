import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
          'Description',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
           Row(
             children: [
               Container(
                 height: 150,
                 width: MediaQuery.of(context).size.width / 3.5,
                 child: Column(
                   children: [
                     Container(
                         height: 120,
                         color: Colors.white,
                         width: MediaQuery.of(context).size.width / 3,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Image.asset('assets/shirt.png'),
                         )),
                   ],
                 ),
               ),
               Container(
                 height: 150,
                 width: MediaQuery.of(context).size.width / 1.4,
                 color: Colors.white,
                 child: Column(
                   children: [
                     SizedBox(
                       height: 7,
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       child: Text(
                         'Here is the title of your first product you add in Shopping Cart',
                         style: GoogleFonts.poppins(
                             textStyle: TextStyle(
                                 color: Colors.grey.shade900, fontSize: 14)),
                       ),
                     ),
                     SizedBox(
                       height: 3,
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       child: Row(
                         children: [
                           Text(
                             '₹ 240',
                             style: GoogleFonts.poppins(
                                 textStyle: TextStyle(
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 12)),
                           ),
                         ],
                       ),
                     ),
                    
                     
                   ],
                 ),
               )
             ],
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                height: 1,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                               'Os túneis de Uptown Hudson são um par de túneis ferroviários da PATH entre Manhattan, Nova Iorque, a leste, e Jersey City, Nova Jérsei, a oeste. Os túneis começam numa junção de duas linhas do sistema na costa de Nova Jérsei e cruzam o rio Hudson em direção leste. No lado nova-iorquino, o trajeto dos túneis passa majoritariamente sob a Christopher Street e a Sexta Avenida, tendo quatro paradas intermediárias antes da estação 33rd Street, o terminal. Apesar do nome, os túneis não passam por Uptown Manhattan, tendo sido chamados assim por serem localizados ao norte dos túneis de Downtown Hudson, que conectam Jersey City e o World Trade Center.',
                               style: GoogleFonts.poppins(
                                   textStyle: TextStyle(
                                       color: Colors.grey.shade700,
                                       
                                       fontSize: 12)),
                             ),
            ),
          ],
        ),
      ),
    );
  }
}