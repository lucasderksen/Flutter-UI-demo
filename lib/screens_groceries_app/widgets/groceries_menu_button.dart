import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/constants/color_pallete_groceries.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceriesMenuButton extends StatefulWidget {

  final bool active;
  final String title;
  GroceriesMenuButton({required this.active,required this.title});

  @override
  _GroceriesMenuButtonState createState() => _GroceriesMenuButtonState();
}

class _GroceriesMenuButtonState extends State<GroceriesMenuButton> {

  @override
  Widget build(BuildContext context) {
    return widget.active ? Column(
      children: [
        Text(
          widget.title,
          style: GoogleFonts.ubuntu(
              color: ColorPaletteGroceries().titleColor, fontSize: 20.0),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 20,
          height: 5,
          decoration: BoxDecoration(
            color: ColorPaletteGroceries().accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        )
      ],
    ): Column(
      children: [
        SizedBox(height: 6,),
        Text(
          widget.title,
          style: GoogleFonts.ubuntu(
              color: ColorPaletteGroceries().subTitleColor, fontSize: 14.0),
        ),
      ],
    );
  }
}