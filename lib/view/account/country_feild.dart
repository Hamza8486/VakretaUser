import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/services/apiservice.dart';
class CountryFeild extends StatefulWidget {
  const CountryFeild({Key? key}) : super(key: key);

  @override
  State<CountryFeild> createState() => _CountryFeildState();
}

class _CountryFeildState extends State<CountryFeild> {
  final TextEditingController _country=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:ApiService().getCountry(),
      builder:(context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return  TextFormField(
            controller: _country,
            decoration: InputDecoration(
                suffixIcon:PopupMenuButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 30,
                    ),
                    itemBuilder: (context) => [
                      for(int i =0 ;i< snapshot.data.countries.length;i++)
                      PopupMenuItem(
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                snapshot.data.countries[i].name,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                            ],
                          ))]),
                hintText: 'Select Country',
                labelText: 'Select Country',
                hintStyle: GoogleFonts.poppins(
                    textStyle:TextStyle(
                        color: Colors.grey.shade500,fontSize: 15
                    )
                )
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );

      } ,

    );
  }
}
