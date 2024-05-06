import 'package:flutter/material.dart';
import 'package:PeluqueriaYvette/components/my_drawer.dart';
import 'package:PeluqueriaYvette/models/product.dart';
import 'package:PeluqueriaYvette/models/shop.dart';
import 'package:provider/provider.dart';
import 'SubcategoryPage.dart'; // Importa la página de subcategoría aquí

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context);

    final List<Product> products = shop.shop;

    // Agrupar productos por categoría y subcategoría
    final Map<String, Map<String, List<Product>>> productsByCategoryAndSubcategory = {};
    for (var product in products) {
      if (!productsByCategoryAndSubcategory.containsKey(product.category)) {
        productsByCategoryAndSubcategory[product.category] = {};
      }
      if (!productsByCategoryAndSubcategory[product.category]!.containsKey(product.subcategory)) {
        productsByCategoryAndSubcategory[product.category]![product.subcategory] = [];
      }
      productsByCategoryAndSubcategory[product.category]![product.subcategory]?.add(product);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Página de compra"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        itemCount: productsByCategoryAndSubcategory.length,
        itemBuilder: (context, index) {
          final category = productsByCategoryAndSubcategory.keys.elementAt(index);
          final subcategories = productsByCategoryAndSubcategory[category]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  category,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ...subcategories.entries.map((entry) {
                final subcategory = entry.key;
                final subcategoryProducts = entry.value;
                final firstProduct = subcategoryProducts.isNotEmpty ? subcategoryProducts.first : null;

                return ListTile(
                  title: Text(subcategory),
                  onTap: () {
                    if (firstProduct != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubcategoryPage(subcategoryProducts)),
                      );
                    }
                  },
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
