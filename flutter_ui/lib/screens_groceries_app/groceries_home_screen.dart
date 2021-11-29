import 'package:flutter/material.dart';
import 'package:flutter_ui/constants/color_pallete_groceries.dart';
import 'package:flutter_ui/screens_groceries_app/groceries_grid_item.dart';
import 'package:flutter_ui/screens_groceries_app/widgets/groceries_button.dart';
import 'package:flutter_ui/screens_groceries_app/widgets/groceries_menu_button.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceriesHomeScreen extends StatefulWidget {
  @override
  _GroceriesHomeScreenState createState() => _GroceriesHomeScreenState();
}

class _GroceriesHomeScreenState extends State<GroceriesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: ColorPaletteGroceries().bottomBarColor,
          ),
          Positioned(
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight - (screenHeight/7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Online Food',
                  style: GoogleFonts.ubuntu(
                      color: Color(0XFF23163D),
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery!',
                      style: GoogleFonts.ubuntu(
                          color: Color(0XFF23163D),
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.fastfood,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ), // title
          Positioned(
            top: 40,
            right: 20,
            child: GroceriesButton(),
          ), // notification button
          Positioned(
            top: screenHeight - ((screenHeight / 4) * 3),
            child: Column(
              children: [
                Container(
                  width: screenWidth - 40,
                  height: screenHeight / 8,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorPaletteGroceries().titleColor,
                        ),
                        filled: true,
                        fillColor: ColorPaletteGroceries().imageBgColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.only(top: 10, left: 10),
                        hintText: 'Restaurants, foods, drinks',
                        hintStyle: GoogleFonts.ubuntu(
                          color: ColorPaletteGroceries().subTitleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: Icon(
                          Icons.settings_rounded,
                          color: ColorPaletteGroceries().titleColor,
                        )),
                  ),
                ), // inputField
                Container(
                  width: screenWidth - 40,
                  height: screenHeight / 12,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GroceriesMenuButton(active: true,title: 'Vegetable',),
                      SizedBox(
                        width: 20,
                      ),
                      GroceriesMenuButton(active: false,title: 'Fruits',),
                      SizedBox(
                        width: 20,
                      ),
                      GroceriesMenuButton(active: false,title: 'Bakery',),
                      SizedBox(
                        width: 20,
                      ),
                      GroceriesMenuButton(active: false,title: 'Fastfood',),
                      SizedBox(
                        width: 20,
                      ),
                      GroceriesMenuButton(active: false,title: 'Drinks',),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(),
                    Container(
                        width: screenWidth - 40,
                        height: (screenHeight / 2) - (screenHeight / 12),
                        child:
                            NotificationListener<OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 20,
                            padding: EdgeInsets.only(bottom:30.0),
                            children: [
                              GroceriesGridItem(),

                              GroceriesGridItem(),

                              GroceriesGridItem(),

                              GroceriesGridItem(),
                            ],
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          Positioned(bottom:0, child: Container(
            height: (screenHeight/7)+2,
            width: screenWidth,
            color: ColorPaletteGroceries().bottomBarColor,

          ),
          ),// navigation bar
          Positioned(
              bottom: (screenHeight/20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.black.withOpacity(0.5))),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.black.withOpacity(0.5))),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          color: ColorPaletteGroceries().inactiveColor,
                        ),
                        Text(
                          'Order List',
                          style: TextStyle(
                            color: ColorPaletteGroceries().inactiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.black.withOpacity(0.5))),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_basket_outlined,
                          color: ColorPaletteGroceries().inactiveColor,
                        ),
                        Text(
                          'My Cart',
                          style: TextStyle(
                            color: ColorPaletteGroceries().inactiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.black.withOpacity(0.5))),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: ColorPaletteGroceries().inactiveColor,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: ColorPaletteGroceries().inactiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}




