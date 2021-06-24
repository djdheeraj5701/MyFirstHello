import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/mycartservices.dart';
import '../widgets/mycartwidgets.dart';


class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCartBasket.calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: Stack(
            children: [
              CartHeader(),
              Positioned(
                top: 132,left: 0,
                child: Container(
                  width: 120,height: 120,
                  color: Color(0xff07FEC9),
                ),
              ),
              Positioned(
                top: 132,left: 0,
                child: Container(
                  width: 120,height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(120)),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 132,
                  ),
                  Expanded(
                    child: myCartBasket.basket.length==0?
                    Container():
                    Container(
                      child: ListView.builder(
                          itemCount: myCartBasket.basket.length,
                          itemBuilder: (context,i){
                            return Container(
                              width: 375,height: 144,
                              color: Color(0x00ffffff),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,top: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: 120,height: 120,
                                        child: Image(
                                          image: AssetImage(myCartBasket.basket[i].imgsrc),//'assets/images/1.png'
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,left:132,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            myCartBasket.basket[i].title,
                                            style: TextStyle(
                                              fontFamily: "Circular Std",
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            myCartBasket.basket[i].subtitle,
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 120,height: 60,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        setState(() {
                                                          myCartBasket.basket[i].changeQty(-1);
                                                          if(myCartBasket.basket[i].qty<=0)
                                                            myCartBasket.removeFromBasket(i);
                                                          myCartBasket.calculateTotal();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 30,height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffffeeee)
                                                        ),
                                                        child: Icon(
                                                          FontAwesomeIcons.minus,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: 30,height: 30,
                                                        decoration: BoxDecoration(
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "${myCartBasket.basket[i].qty}",
                                                            style: TextStyle(
                                                              fontFamily: "Avenir",
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        setState(() {
                                                          myCartBasket.basket[i].changeQty(1);
                                                          myCartBasket.calculateTotal();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 30,height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffeeffee)
                                                        ),
                                                        child: Icon(
                                                          FontAwesomeIcons.plus,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "Rs.\n${myCartBasket.basket[i].cost}",
                                                  style: TextStyle(
                                                    fontFamily: "Avenir",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,top: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          myCartBasket.removeFromBasket(i);
                                          myCartBasket.calculateTotal();
                                        });
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.only(right:12.0,top:12),
                                          child: crossIcon
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 96,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.only(bottomRight: Radius.circular(42),bottomLeft: Radius.circular(42)),
                      color: Color(0xfff7f7f7),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,top: 0,bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "T O T A L \nRs. ${myCartBasket.total}",
                              style: TextStyle(
                                fontFamily: "Circular Std",
                                fontSize: 24,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,top: 0,bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 180,height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Color(0xff00241c),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Text(
                                    "Checkout",
                                    style: TextStyle(
                                      fontFamily: "Avenir",
                                      fontSize: 21,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}






