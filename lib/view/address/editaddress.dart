import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/services/apiservice.dart';

import '../../models/listaddressModel.dart';

class EditAddress extends StatefulWidget {
  EditAddress({Key? key, required this.default_, required this.object})
      : super(key: key);
  int default_;
  ListAddressModel object;

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _company = TextEditingController();
  TextEditingController _address1 = TextEditingController();
  TextEditingController _address2 = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _postcode = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _zone = TextEditingController();

  setvalues() {
    _firstname.text = widget.object.firstname ?? '';
    _lastname.text = widget.object.lastname ?? '';
    _company.text = widget.object.company ?? '';
    _address1.text = widget.object.address1 ?? '';
    _address2.text = widget.object.address2 ?? '';
    _city.text = widget.object.city!;
    _postcode.text = widget.object.postcode ?? '';
    _country.text = widget.object.country ?? '';
    _zone.text = widget.object.zone ?? '';
  }

  var dropdownvalue;
  int? customer_id;
  int country_id = 99;
  int zone_id = 1493;
  String country_name = 'Country';
  String zone_name = 'State';
  dynamic country;
  dynamic zone;
  SharedPreferences? sharedPrefs;

  @override
  initState() {
    super.initState();
    getSharedPref();
    setvalues();
  }

  Future<void> getSharedPref() async {
    SharedPreferences.getInstance().then((prefs) {
      // setState(() => sharedPrefs = prefs);
      sharedPrefs = prefs;
      Int? _customer_id = sharedPrefs?.getInt("customer_id") as Int?;
      setState(() {
        customer_id = _customer_id.toString() as int?;
      });
    });
  }

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
          'Edit Address',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _firstname,
                decoration: InputDecoration(
                    hintText: 'First Name',
                    labelText: 'First Name',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _lastname,
                decoration: InputDecoration(
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _company,
                decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    labelText: 'Mobile Number',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _address1,
                decoration: InputDecoration(
                    hintText: 'Pin Code',
                    labelText: 'Pin Code',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _address2,
                decoration: InputDecoration(
                    hintText: 'Address',
                    labelText: 'Address',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15))),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder(
                  future: ApiService().getCountry(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return TextFormField(
                        controller: _country,
                        decoration: InputDecoration(
                            suffixIcon: PopupMenuButton(
                                initialValue: 99,
                                onSelected: (val) {
                                  print(val.toString());
                                  country_id = int.parse(val.toString());
                                  dynamic targetCountry =
                                  snapshot.data.countries.firstWhere(
                                          (e) => e.countryId == val.toString());
                                  country_name = targetCountry.name;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                itemBuilder: (context) => [
                                  for (int i = 0;
                                  i < snapshot.data.countries.length;
                                  i++)
                                    PopupMenuItem(
                                        onTap: () {
                                          //print('1');
                                        },
                                        value: snapshot
                                            .data.countries[i].countryId,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot
                                                  .data.countries[i].name,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors
                                                          .grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ))
                                ]),
                            hintText: country_name.toString(),
                            labelText: country_name.toString(),
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 15))),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder(
                  future: ApiService().getZone(country_id),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return TextFormField(
                        controller: _zone,
                        decoration: InputDecoration(
                            suffixIcon: PopupMenuButton(
                                initialValue: 99,
                                onSelected: (val) {
                                  print(val.toString());
                                  zone_id = int.parse(val.toString());
                                  dynamic targetzone = snapshot.data.zone
                                      .firstWhere(
                                          (e) => e.zoneId == val.toString());
                                  zone_name = targetzone.name;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                itemBuilder: (context) => [
                                  for (int i = 0;
                                  i < snapshot.data.zone.length;
                                  i++)
                                    PopupMenuItem(
                                        onTap: () {
                                          //print('1');
                                        },
                                        value: snapshot.data.zone[i].zoneId,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data.zone[i].name,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors
                                                          .grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ))
                                ]),
                            hintText: zone_name.toString(),
                            labelText: zone_name.toString(),
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 15))),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _city,
                decoration: InputDecoration(
                    hintText: 'City',
                    labelText: 'City',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15))),
              ),
            ),




            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(4)),
                child: InkWell(
                  onTap: () async {
                    if (_firstname.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "First Name must be between 1 and 32 characters!"),
                        backgroundColor: Colors.red,
                      ));
                      // error password can not b empty
                    } else if (_lastname.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Last Name must be between 1 and 32 characters"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (_address1.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Address must be between 3 and 128 characters!"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (_address2.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Address2 must be between 3 and 128 characters!"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (_city.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                        Text("City must be between 2 and 128 characters!"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (country_id == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please select a country"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (zone_id == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please select a region / state!'),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      ApiService().editAddress(
                        _firstname.text,
                        widget.object.addressId.toString(),
                        _lastname.text,
                        _company.text,
                        _address1.text,
                        _address2.text,
                        _city.text,
                        _postcode.text,
                        country_id,
                        zone_id,
                        widget.default_,
                      );

                    }
                  },
                  child: Center(
                    child: Text(
                      'Update',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
