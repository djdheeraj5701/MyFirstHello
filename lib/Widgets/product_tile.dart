import 'package:flutter/material.dart';
import '../Pages/InfoPage.dart';
import '../model/product.dart';

class ProductTile extends StatelessWidget {
  final Food product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPage(product: product,),
        ));
    },
      child: Card(
        color: Colors.lightGreen,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "image-tag${product.imageURL}",
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        product.imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: true
                            ? Icon(Icons.favorite_rounded)
                            : Icon(Icons.favorite_border),
                        onPressed: () {

                        },
                      ),
                    )),
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                style:
                TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              if (product.quantityUnit != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.quantityUnit.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 8),
              Text('\$${product.price}',
                  style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
            ],
          ),
        ),
      ),
    );
  }
}