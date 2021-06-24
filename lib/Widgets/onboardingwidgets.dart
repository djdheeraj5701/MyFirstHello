import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtBoard extends StatelessWidget {
  List<double> size;
  Color color;
  double round;
  Widget child;

  ArtBoard({this.size,this.color,this.round,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size[0],
      height: size[1],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(round),
        color: color,
      ),
      child: child,
    );
  }
}

class BoardText extends StatelessWidget {
  String headtext,bodytext;
  Function function;
  int total,curr;

  BoardText({this.headtext,this.bodytext,this.function,this.total,this.curr});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48,left: 42,right: 42,bottom: 48),
      child: Column(
        children: [
          AutoSizeText(
            headtext,
            maxLines: 2,
            style: TextStyle(
              fontFamily: "Circular Std",
              fontSize: 30,
            ),
          ),
          SizedBox(height: 16,),
          AutoSizeText(
            bodytext,
            maxLines: 5,
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 16,
            ),
          ),
          Expanded(child: SizedBox(height: 64,)),
          Row(
            children: [
              BoardCarousel(total:total,curr:curr),
              Expanded(child: SizedBox()),
              BoardButton(function: function,)
            ],
          ),
        ],
      ),
    );
  }
}

class BoardCarousel extends StatelessWidget {
  int total,curr;

  BoardCarousel({this.total,this.curr});

  Dot(){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 7, height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
          color: Color(0xff00241c),
        ),
      ),
    );
  }

  Dash(){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 21,height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
          color: Color(0xff07FEC9),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21.0+15*(total),
      height: 11,
      child: ListView.builder(
          itemCount: total,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            if(index==curr) return Dash();
            else return Dot();
          },
      ),
    );
  }
}

class BoardButton extends StatefulWidget {
  Function function;

  BoardButton({this.function});

  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.function();
        });
      },
      child: Container(
        width: 60,height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff00241c),
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.arrowRight,
            color: Color(0xffffffff),
            size: 21,
          )
        ),
      ),
    );
  }
}



