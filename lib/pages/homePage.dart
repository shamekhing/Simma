import 'package:flutter/material.dart';
import 'dart:io'; // for using HttpClient
import 'dart:convert'; // for using json.decode()
import '../widgets/cardList.dart';

class HomePage extends StatefulWidget {
  static const homePageRoute = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about products
  List productData = [];
  List catagoryData = [];

  Future<void> _fetchCatagoryData() async {
    const API_URL = 'https://fakestoreapi.com/products/categories';
    HttpClient client = new HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(API_URL));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content);
    print(data);
    setState(() {
      catagoryData = data;
    });
  }

  Future<void> _fetchProductsData(String path) async {
    String API_URL = 'https://fakestoreapi.com/products/category/' + path;

    HttpClient client = new HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(API_URL));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content);
    //print(data);
    setState(() {
      productData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Simma Task'),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black54,
          child: ListView.builder(
              itemCount: catagoryData.length,
              itemBuilder: (
                context,
                index,
              ) {
                return ElevatedButton(
                  onPressed: () => _fetchProductsData(catagoryData[index]),
                  child: Text(
                    catagoryData[index],
                  ),
                );
              }),
        ),
        body: productData.length == 0
            ? Center(
                child: ElevatedButton(
                  child: Text('Load Catagories'),
                  onPressed: _fetchCatagoryData, //_fetchData,
                ),
              )
            : CardList(productData));
  }
}
