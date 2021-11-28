import 'package:flutter/material.dart';
import 'package:ordertakingapp/model/Food.dart';
import 'package:ordertakingapp/model/MyOrderedFoodList.dart';
import 'package:ordertakingapp/util/Colors.dart';
import 'package:ordertakingapp/util/ToastUtil.dart';
import 'package:ordertakingapp/util/values.dart';

class FoodCard extends StatefulWidget {

  final Food food;
  final int type;

  FoodCard({this.food, this.type});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> with SingleTickerProviderStateMixin{

  Food get food => widget.food;
  int get type => widget.type;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Card(
          elevation: 5.0,
          shape: roundedRectangle12,
          child: Column(
            children: <Widget>[
//              buildImage(),
              buildTitle(),
              buildPriceInfo(),
              buildAddToCart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        food.image,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 6,
        loadingBuilder: (context, Widget child, ImageChunkEvent progress) {
          if (progress == null) return child;
          return Center(
            child: CircularProgressIndicator(value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes : null),
          );
        },
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Text(
        food.name,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Text(
        'KR ${food.price}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, ),
      ),
    );
  }

  Widget buildAddToCart(){
    return  Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Card(
        margin: EdgeInsets.only(right: 0),
        shape: roundedRectangle4,
        color: MyColors.mainColor,
        child: InkWell(
          onTap: addItemToCard,
          splashColor: Colors.white70,
          customBorder: roundedRectangle4,
          child: Center(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Add to Order", style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w600),),
          ),),
        ),
      ),
    );
  }

  addItemToCard() {

    ToastUtil.showToast(context, '${food.name} added to order');

    if(type == 1){
      food.isUpdate = 1;
      food.isNew = 1;
      addItemsToList1(food: food);
    }else{
      addItemsToList(food: food);
      food.isUpdate = 0;
      food.isNew = 0;
    }

    print(getTotalPrice());
    print(toJson());

  }
}
