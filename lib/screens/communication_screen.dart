
import 'dart:ui';
import 'package:app_dgp/components/round_button.dart';
import 'package:app_dgp/components/textInputRound.dart';
import 'package:app_dgp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CommunicationScreen extends StatefulWidget{
  CommunicationScreen();

  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading:
          Transform.scale(
          scale: 2,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: kPrimaryWhite,
                  ),
                onPressed: () {  },
              )
          /*
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName('/menu'));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FilterScreen(shoppingCart: widget.cart);
                },
              ),
            );
          }*/
      ),
      title: Text(
        "Tablero de comunicación",
        style: GoogleFonts.arimo(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: kPrimaryWhite,
        ),
      ),
      centerTitle: true,
    );
  }
    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int gridMap =20;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextInputRound(
                hintText: "",
                onChanged: (value) {}
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50,right: 10),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildGridView(gridMap,Colors.green.shade400),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child:  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 40),child: Text("PICTOGRAMAS", textScaleFactor: 1.5,)),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Transform.scale(
                          scale: 6,
                          child: IconButton(
                            icon: const Icon(
                                Icons.folder_special,
                                color: kPrimaryColor,
                            ),
                            tooltip: 'Más pictogramas',
                            onPressed: () {
                              setState(() { });
                            },
                          ),
                          ),
                        ),
                      RoundButton(text: 'leer', icon: Icons.play_circle_fill, onPressed: (){}) ,
                      RoundButton(text: 'borrar', icon: Icons.backspace, onPressed: (){}) ,
                      RoundButton(text: 'limpiar',icon: Icons.clear, onPressed: (){}) ,
                    ],
                  )
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridView(int num, Color color){
    Size size = MediaQuery.of(context).size;
    final ButtonStyle style =ElevatedButton.styleFrom(
      textStyle: GoogleFonts.arimo(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: kPrimaryWhite,
      ),
      primary: Colors.teal,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Colors.teal,
            width: 2.0,
          ),
        ),
    );

    return Container(
      width: size.width*0.8,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 30,
            mainAxisSpacing: 20,
            childAspectRatio: 3/2
          // mainAxisExtent: 100
        ),
        itemCount: num,
        itemBuilder: (context, index){
         /* return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color
            ),
          );*/
          return ElevatedButton(
            style: style,
            onPressed: () {},
            child: Text('PICTO '+(index+1).toString()),
          );
        }
      ),
    );
  }

}