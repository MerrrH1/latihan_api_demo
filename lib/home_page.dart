import 'package:flutter/material.dart';
import 'package:latihan_api_demo/repository/product_repository.dart';
import 'package:latihan_api_demo/response/product_response.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductRepository productRepository = ProductRepository();
  late final Future<ProductResponse> futureProducts;

  @override
  void initState() {
    futureProducts = productRepository.getProducts();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Latihan API Demo"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: FutureBuilder(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemCount: snapshot.data!.listProduct.length,
                itemBuilder: (context, index) {
                  
                })
              }
        }));
  }
}
