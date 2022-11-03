import 'package:app_dgp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget{
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color, textColor;
  const RoundButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = kPrimaryWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.1,
      height: size.height*0.12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            color: color,
            onPressed: onPressed,

            child: Column(
              children: [
                Icon(
                  icon,
                  color: kPrimaryWhite,
                  size: 40,
                ),
                Text(
                  text,
                  style: GoogleFonts.arimo(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  ),
              ]
            )
          ),
        ),
    );
  }

}