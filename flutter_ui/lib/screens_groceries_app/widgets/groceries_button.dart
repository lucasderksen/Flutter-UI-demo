import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/constants/color_pallete_groceries.dart';

class GroceriesButton extends StatelessWidget {
  const GroceriesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [
            ColorPaletteGroceries().accentGradientStartColor,
            ColorPaletteGroceries().accentGradientStopColor,
          ],
          stops: [0.0, 0.9],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color:
            ColorPaletteGroceries().accentColor.withOpacity(0.4),
            spreadRadius: 0.3,
            blurRadius: 8,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        width: 50,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.zero),
          onPressed: () {},
          child: Icon(
            Icons.notifications_none,
            size: 30,
          ),
        ),
      ),
    );
  }
}