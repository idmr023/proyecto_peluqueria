import 'package:PeluqueriaYvette/components/my_drawer.dart';
import 'package:PeluqueriaYvette/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PeluqueriaYvette/models/shop.dart';

class SubcategoryPage extends StatelessWidget {
  final List<Product> subcategoryProducts;

  SubcategoryPage(this.subcategoryProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subcategoryProducts.first.subcategory),
      ),
      drawer: const MyDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: subcategoryProducts.map((product) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(product.name),
                Text('\$${product.price.toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    context.read<Shop>().addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} agregado al carrito'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Agregar al carrito'),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
