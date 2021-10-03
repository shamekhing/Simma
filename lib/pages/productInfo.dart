import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  static String routeName = "/product-info";

  ProductInfo();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final info = args['info'];
    final infoKey = info.keys;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
        itemCount: infoKey.length,
        itemBuilder: (
          context,
          index,
        ) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.black38,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Text(
                  infoKey.elementAt(index).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  info[infoKey.elementAt(index)].toString(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
