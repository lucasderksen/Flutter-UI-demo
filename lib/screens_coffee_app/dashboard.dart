import 'package:flutter/material.dart';
import 'package:flutter_ui/constants/color_pallete_coffee.dart';
import 'package:flutter_ui/screens_main/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coffee_overview_default.dart';
import 'cold_brew.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  final colorPalette = ColorPaletteCoffee();

  var _selectedOption = 1;

  List allOption = [
    CoffeeOverviewDefault(),
    ColdBrew(),
    CoffeeOverviewDefault(),
    CoffeeOverviewDefault(),
    CoffeeOverviewDefault(),
  ];

  List isSelected = [false, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          Container(
            height: screenHeight,
            width: screenWidth / 5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.6,
                  0.9
                ],
                    colors: [
                  colorPalette.leftBarColor,
                  Colors.white,
                ])),
          ),
          Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 5),
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 35,
            left: 30,
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen())),
                child: Icon(Icons.home_outlined)),
          ),
          Positioned(
            top: 35,
            right: 30,
            child: Icon(Icons.shopping_bag_outlined),
          ),
          Positioned(
            top: screenHeight - (screenHeight - 80),
            left: (screenWidth / 5) + 25,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CoffeeHouse',
                    style: GoogleFonts.bigShouldersText(
                        color: Color(0XFF23163D), fontSize: 40),
                  ),
                  Text(
                    'A lot can happen over coffee',
                    style: GoogleFonts.bigShouldersText(
                        color: Color(0xFFA59FB0), fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 225,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.4)),
                          ),
                          contentPadding: EdgeInsets.only(top: 10, left: 10),
                          hintText: 'search...',
                          hintStyle: GoogleFonts.bigShouldersText(
                            color: Color(0xFFA59FB0),
                            fontSize: 15,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(0.4),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          buildSideNavigator(),
          Positioned(
            top: screenHeight - (screenHeight - 220),
            left: (screenWidth / 5) + 25,
            child: Container(
              height: screenHeight - ((screenHeight / 3) + 50.0),
              width: screenWidth - ((screenWidth / 5) + 40.0),
              child: allOption[_selectedOption],
            ),
          )
        ],
      ),
    );
  }

  buildSideNavigator() {
    return Positioned(
        top: 75,
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            width: MediaQuery.of(context).size.height - 100,
            height: MediaQuery.of(context).size.width / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOption('Black Gold', 0),
                buildOption('Cold Brew', 1),
                buildOption('Nescafe', 2),
                buildOption('McCafe', 3),
                buildOption('Gold Brew', 4),
              ],
            ),
          ),
        ));
  }

  buildOption(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          isOptionSelected(oldIndex: _selectedOption, newIndex: index);
          _selectedOption = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected[index]
              ? Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF23163D)),
                )
              : Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.transparent),
                ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: isSelected[index]
                ? GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D), fontSize: 18)
                : GoogleFonts.bigShouldersText(
                    color: Color(0xFFA59FB0), fontSize: 17),
          ),
        ],
      ),
    );
  }

  isOptionSelected({required int oldIndex, required int newIndex}) {
    if(oldIndex != newIndex){
      var previousIndex = oldIndex;
      isSelected[newIndex] = true;
      isSelected[previousIndex] = false;
    }

  }
}
