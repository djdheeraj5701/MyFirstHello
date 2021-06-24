import 'package:flutter/material.dart';
import '../model/product.dart';

class InfoPage extends StatefulWidget {
  final Food product;
  InfoPage({ Key key, this.product }): super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: Hero(
              tag: "image-tag${widget.product.imageURL}",
                    child: Image.network(
                    widget.product.imageURL,
                    fit: BoxFit.cover,
                  )
              ),),
              SizedBox(height: 30),
              ListTile(
                  title: Text(
                      widget.product.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[800]
                      )
                  ),
                  subtitle: Text(
                      '${widget.product.price}',
                      style: TextStyle(letterSpacing: 1)
                  ),
              ),
            ],
          ),
        )
    );
  }
}
/*
*/
