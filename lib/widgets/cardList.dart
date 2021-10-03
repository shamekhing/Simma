import 'package:flutter/material.dart';
import 'CardItem.dart';
import '../pages/productInfo.dart';

//'https://fakestoreapi.com/products/category/jewelery'
class CardItem extends StatelessWidget {
  final Map info;
  CardItem(this.info);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductInfo.routeName,
              arguments: {'info': info},
            );
          },
          child: Image.network(
            info['image'],
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            info['title'],
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  List loadedCards;
  CardList(this.loadedCards);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(5.0),
      itemCount: loadedCards.length,
      itemBuilder: (BuildContext ctx, index) =>
          CardItem(loadedCards[index] as Map<String, dynamic>),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
