import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'mycartscreen.dart';
import 'profile_page.dart';
import '../Services/FoodNotifier.dart';
import '../Services/ProductAPI.dart';
import '../Widgets/product_tile.dart';


class List_Page extends StatefulWidget {
  @override
  _List_PageState createState() => _List_PageState();
}

class _List_PageState extends State<List_Page> {
  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }

    print("building Feed");
    return Scaffold(
        body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top+12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12,bottom: 4),
                  child: Text("VEGGIE  MART", style: TextStyle(fontFamily: 'avenir',color:Colors.black,fontSize: 30, fontWeight: FontWeight.bold),),
                ), Row(
                  children: [
                    IconButton(icon: Icon(Icons.shopping_cart,size: 25,), onPressed: (){Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => MyCartScreen()),
                    );},),
                    IconButton(icon: Icon(Icons.person_pin,size: 25,), onPressed: (){Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage()),
                    );},)
                  ],
                )],
              ),
            ),

          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7.0,8,0,8),
              child: Container(height: 40,width: MediaQuery.of(context).size.width*0.95,
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(28)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width:MediaQuery.of(context).size.width*0.6,
                      child: TextField(style: TextStyle(fontSize: 17),)),
                  Icon(Icons.search)
                ],
              ) ,),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10, top: 2, right: 10),
              child: RefreshIndicator(
                onRefresh: _refreshList,
                child: StaggeredGridView.countBuilder(crossAxisCount: 2,
                    padding: EdgeInsets.all(0),
                    itemCount: foodNotifier.foodList.length,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    itemBuilder: (context, index){

                  return ProductTile(foodNotifier.foodList[index]);
                    },
                    staggeredTileBuilder: (index)=> StaggeredTile.fit(1)),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
