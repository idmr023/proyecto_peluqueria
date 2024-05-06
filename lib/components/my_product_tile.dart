import 'package:flutter/material.dart';
import 'package:PeluqueriaYvette/models/product.dart';
import 'package:PeluqueriaYvette/pages/product_detail_page.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              product.imagePath,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(product.name),
            Text("\$${product.price.toStringAsFixed(2)}"),
            // Add more product information here if desired
          ],
        ),
      ),
    );
  }
}
