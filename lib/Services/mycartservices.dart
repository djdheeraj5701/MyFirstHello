class CartProduct{
  String imgsrc;
  String title;
  String subtitle;
  double cost;
  int qty;
  CartProduct({this.imgsrc,this.title,this.subtitle,this.cost,this.qty});
  void changeQty(int i){
    qty+=i;
  }
}

class MyCartBasket{
  double total=0.0;
  List<CartProduct> basket=[
    CartProduct(
      imgsrc: 'assets/images/1.png',
      title: "Bananas",
      subtitle: "per dozen",
      cost: 50.00,
      qty: 3
    )
  ];
  MyCartBasket();
  bool isinBasket(CartProduct product){
    for(CartProduct p in basket){
      if(p.title==product.title)
        return true;
    }
    return false;
  }
  void calculateTotal(){
    double temp=0.0;
    if(basket.length==0) {total=temp;return;}
    for(CartProduct product in basket){
      temp+=product.qty*product.cost;
    }
    total=temp;
  }
  void removeFromBasket(int i){
    basket.removeAt(i);
  }
}

MyCartBasket myCartBasket=MyCartBasket();