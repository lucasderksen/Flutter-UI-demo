import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_ui/constants/color_pallete_coffee.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coffee_detail_default.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItem(
            imgPath: 'assets/coffee4.png',
            price: '150',
            bgColor: ColorPaletteCoffee().secondSlice
        ),
        buildListItem(
            imgPath: 'assets/coffee2.png',
            price: '150',
            bgColor: ColorPaletteCoffee().firstSlice
        ),
      ],
    );
  }

  buildListItem({required String imgPath,
    required String price,
    required Color bgColor}) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CoffeeDetailDefault(imgPath: imgPath, headerColor: bgColor)
          ));
        },
        child: Stack(
          children: [
            Container(
                height: 300.0,
                width: 250.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent
                )
            ),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                            image: AssetImage('assets/doodle.png'),
                            fit: BoxFit.none
                        )
                    )
                )
            ),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white.withOpacity(0.6),
                    )
                )
            ),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: bgColor.withOpacity(0.9),
                    )
                )
            ),
            Positioned(
                left: 100.0,
                child: Hero(
                    tag: imgPath,
                    child: Container(
                        height: 250.0,
                        width: 150.0,
                        child: Image(image: AssetImage(imgPath), fit:BoxFit.scaleDown
                        )
                    )
                )
            ),
            Positioned(
                top: 125.0,
                left: 15.0,
                child: Column(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFF23163D), fontSize: 20.0),
                      ),
                      Text(
                        '\$' + price,
                        style: GoogleFonts.bigShouldersText(
                            color: Colors.white, fontSize: 40.0),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Grady\'s COLD BREW',
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFF23163D), fontSize: 27.0),
                      ),
                      SizedBox(height: 2.0),
                      Container(
                          width: 200.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '65 reviews',
                                        style: GoogleFonts.bigShouldersText(
                                            color: Colors.white, fontSize: 15.0),
                                      ),
                                      RatingStars(
                                        value: 3,
                                        starBuilder: (index, color) => Icon(
                                          Icons.star,
                                          color: color,
                                        ),
                                        starCount: 5,
                                        starSize: 20,
                                        maxValue: 5,
                                        starSpacing: 2,
                                        maxValueVisibility: true,
                                        valueLabelVisibility: false,
                                        animationDuration: Duration(milliseconds: 1000),
                                        starOffColor: const Color(0xffe7e8ea),
                                        starColor: Colors.yellow,
                                      ),
                                    ]
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 75.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7.0),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add, size: 17.0),
                                              SizedBox(width: 5.0),
                                              Text('Add',
                                                style: GoogleFonts.bigShouldersText(
                                                    color: Color(0xFF23163D), fontSize: 15.0),
                                              )
                                            ]
                                        )
                                    )
                                )
                              ]
                          )
                      )
                    ]
                )
            )
          ],
        )
    );
  }
}
