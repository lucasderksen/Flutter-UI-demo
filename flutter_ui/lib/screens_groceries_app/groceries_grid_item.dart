import 'package:flutter/material.dart';
import 'package:flutter_ui/constants/color_pallete_groceries.dart';
import 'package:flutter_ui/screens_groceries_app/groceries_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceriesGridItem extends StatefulWidget {
  @override
  _GroceriesGridItemState createState() => _GroceriesGridItemState();
}

class _GroceriesGridItemState extends State<GroceriesGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroceriesDetailScreen()));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorPaletteGroceries().imageBgColor,
                borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,10,30,60),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/groceries1.png'),
                        fit: BoxFit.scaleDown
                    ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: Container(
              width: 55,
              height: 40,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.4,
                  ],
                  colors: [
                    ColorPaletteGroceries().accentGradientStartColor,
                    ColorPaletteGroceries().accentGradientStopColor,
                  ],
                ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(0,5),
                        color: ColorPaletteGroceries().accentColor.withOpacity(0.4))
                  ],

                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12))),
              child: Icon(Icons.shopping_basket_rounded, size: 20.0,color: Colors.white,),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Capsicum',
                      style: GoogleFonts.ubuntu(
                          color: ColorPaletteGroceries().titleColor, fontSize: 14.0,fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Deshi Fresh Product',
                      style: GoogleFonts.ubuntu(
                          color: ColorPaletteGroceries().subTitleColor, fontSize: 14.0),
                    ),
                    Text(
                      '€7,98',
                      style: GoogleFonts.ubuntu(
                          color: ColorPaletteGroceries().titleColor, fontSize: 20.0),
                    ),
                  ],
                ),
              )),
          Positioned(bottom: 0, right: 0, child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '1kg Price',
              style: GoogleFonts.ubuntu(
                  color: ColorPaletteGroceries().subTitleColor, fontSize: 10.0),
            ),
          ))
        ],
      ),
    );
  }
}
