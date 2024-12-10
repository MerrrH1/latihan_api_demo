import 'package:flutter/material.dart';
import 'package:latihan_api_demo/models/product_models.dart';
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
    productRepository.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan API Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.listProduct.length,
                  itemBuilder: (context, index) {
                    ProductModel productModel =
                        snapshot.data!.listProduct[index];
                    debugPrint(productModel.title);
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(productModel.id.toString()),
                      ),
                      title: Text(productModel.title),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(productModel.stock.toString()),
                          Text("\$ " + productModel.price.toString())
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
