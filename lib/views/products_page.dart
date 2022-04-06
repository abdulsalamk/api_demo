import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/products.dart';
import '../services/products_services.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product>? products;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //ftech Data from API
    getData();
  }

  getData() async {
    products = await ProductsService().getProducts();

    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product')),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            products![index].productName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            products![index].productDescription ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            NumberFormat.currency(locale: 'en_GB').format(
                                double.tryParse(
                                    products![index].buyPrice ?? '0.00')),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]))
                  ]),
                );
              }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
