import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/helper/widgets/product-percentage-label.dart';

import '../../view/product/productdisplay.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.context,
    required this.product,
  }) : super(key: key);
  final product;
  final context;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool dis = false;
  @override
  void initState() {
    super.initState();
    check(widget.product['price'], widget.product['special'].toString());
  }

  check(String price, String special) {
    int p = int.parse(price.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    int sp = int.parse(special.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    double d = ((p - sp) / p) * 100;
    if (d.toInt() > 0) {
      setState(() {
        dis = true;
      });
    } else {
      setState(() {
        dis = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
              animation = CurvedAnimation(parent: animation, curve: Curves.linear);
              return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
            },
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
              return ProductDisplay(0
                //TODO Talha Edit this
                  //int.parse(widget.product['product_id'])
              );
            }));
      },
      child: Container(
        height: 180,
        width: 135,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 100,
                width: 130,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(widget.product['thumb']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.product['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13)),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      widget.product['special'].toString(),
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    for (int star = 0; star < widget.product['rating']; ++star)
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (dis)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(children: [
                Container(
                  height: 30,
                  width: 40,
                  decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
                  child: Center(
                    child: productPercentageLabel(widget.product['price'], widget.product['special'].toString()),
                  ),
                ),
              ]),
            ),
        ]),
      ),
    );
  }
}

Widget productCardModel(context, product) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
            //TODO:// Edit 02
            return ProductDisplay(0
                //int.parse(product.productId.toString())
                );
          }));
    },
    child: Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                product.thumb2,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13)),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    product.price,
                    style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  if (product.rating != null)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              for (int star = 0; star < product.rating; ++star)
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          product.rating.toString(),
                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(children: [
            Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    '-60%',
                    style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ))
          ]),
        ),
      ]),
    ),
  );
}
