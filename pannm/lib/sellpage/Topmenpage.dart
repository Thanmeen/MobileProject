

import 'package:flutter/material.dart';
import 'package:pannm/sellpage/Topdealpage.dart';
import 'package:pannm/sellpage/Topwomenpage.dart';
import 'package:pannm/sellpage/kidpage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Topmenpage(),
    );
  }
}

class Topmenpage extends StatefulWidget {
  @override
  _TopmenpageState createState() => _TopmenpageState();
}

class _TopmenpageState extends State<Topmenpage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.sort),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 253, 0, 0),
          labelColor: Colors.red,
          tabs: [
            Tab(
              text: 'TOP',                          
            ),
            Tab(
              text: 'MEN',
            ),
            Tab(
              text: 'WOMEN',
            ),
            Tab(
              text: 'KIDS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Center(
              child: Text('TOP'),
            ),

          ),
          
          // เพิ่มหน้าอื่น ๆ ที่ต้องการเชื่อมโยงที่นี่
          Container(
            child: Center(
              child: ProductMenPage(),
            ),
          ),
          Container(
            
            child: Center(
              child: ProductWomenPage(),
            ),
          ),
          Container(
            
            child: Center(
              child: ProductKidPage(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}



class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductMenPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Black hoodie',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228032152848039966/blackhood.jpg?ex=662a9110&is=66181c10&hm=9320b66f22894b4341d2ee714aa2285122a7bfdbec962d8cced1dd202a63033d&',
      price: 350,
    ),
    Product(
      name: 'White T-shirt',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228031289614139623/white.png?ex=662a9043&is=66181b43&hm=b845443135c3ce22170aafe834b81c37e5deacbf0a864022d8e76320e9d67420&',
      price: 200,
    ),
    Product(
      name: 'Hawaii shirt', 
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228031289299304458/hawaii.jpg?ex=662a9043&is=66181b43&hm=338762e07290669bbf8169098384478e76fcc6d3d454974ea8e5a2ae976ea739&', 
      price: 199)
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  product.imageUrl,
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8), // ระยะห่างระหว่างรูปภาพและข้อความ
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\฿${product.price.toStringAsFixed(2)}',
                  style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
