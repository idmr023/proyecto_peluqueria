import 'package:flutter/material.dart';
import 'package:PeluqueriaYvette/components/my_button.dart';
import 'package:PeluqueriaYvette/models/product.dart';
import 'package:PeluqueriaYvette/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
const CartPage({ super.key }) ;

  void removeItemFromCart(BuildContext context, Product product){
    
    
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: const Text("¿Eliminar este item de tu carrito?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),

          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              
              context.read<Shop>().addToCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        content: 
          Text("El usuario desea pagar"),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Carrito de compra"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
              ? Center(child: const Text("Tu carrito de compras se encuentra vacío")) 
              : ListView.builder(
              itemCount: cart.length,
              itemBuilder: ((context, index) {
                final item = cart[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              }
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MyButton(
            onTap: () => Navigator.pushNamed(context, '/appointments_page'), child: Text("Reservar cita")),
        )

        ],
      ),
    );
  }
}