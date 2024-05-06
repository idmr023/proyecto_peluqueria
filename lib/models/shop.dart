import 'package:PeluqueriaYvette/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{  

  final List<Product> _shop = [
    Product(
      name: "Maquillaje",
      price: 40.00,
      description: "Servicio profesional de maquillaje que resalta los rasgos naturales y realza la belleza de cada cliente, utilizando productos de alta calidad y técnicas especializadas.",
      imagePath: "assets/publi2.png",
      category: "Servicios complementarios",
      subcategory:  "Maquillaje", 
    ),

    Product(
    name: "Depilación facial",
    price: 25.00,
    description: "Servicio de depilación facial que utiliza técnicas suaves y efectivas para eliminar el vello no deseado del rostro, dejando la piel suave y libre de irritaciones.",
    imagePath: "assets/depilacion_facial1.jpg",
    category: "Servicios complementarios",
    subcategory: "Depilación facial"
  ),

  Product(
    name: "Pedicure",
    price: 180.00,
    description: "Tratamiento estético para los pies que incluye cuidado de las uñas, exfoliación, hidratación y masaje, garantizando pies suaves y bien cuidados.",
    imagePath: "assets/pedicure_1.jpg",
    category: "Servicios complementarios",
    subcategory: "Pedicure"
  ), 

    Product(
      name: "Manicure",
      price: 200,
      description: "Tratamiento cosmético para las uñas y las manos que ayuda a mantenerlas saludables y con un aspecto impecable.",
      imagePath: "assets/1.jpg",
      category: "Servicios complementarios",
      subcategory:  "Manicure", 
    ),
    
    Product(
      name: "Paquete de novia",
      price: 200,
      description: "Oferta especial para novias que incluye servicios de peinado y maquillaje para el día de su boda, asegurando que luzcan radiantes y hermosas en su gran día.",
      imagePath: "assets/paquete_novia1.jpeg",
      category: "Paquetes",
      subcategory:  "Paquetes", 
    ),
    
    Product(
      name: "Corte caballero ",
      price: 15,
      description: "Un servicio de corte de cabello especializado para hombres, que ofrece una variedad de estilos y técnicas adaptadas a las preferencias individuales de cada cliente, garantizando un aspecto fresco y cuidado.",
      imagePath: "assets/corte_cabello_hombre1.jpg",
      category: "Cortes de cabello",
      subcategory: "Cortes caballero"
    ),

    Product(
      name: "Corte caballero 2",
      price: 15,
      description: "Un servicio de corte de cabello especializado para hombres, que ofrece una variedad de estilos y técnicas adaptadas a las preferencias individuales de cada cliente, garantizando un aspecto fresco y cuidado.",
      imagePath: "assets/corte_cabello_hombre2.jpg",
      category: "Cortes de cabello",
      subcategory: "Cortes caballero"
    ),

    Product(
      name: "Corte mujer 1",
      price: 15,
      description: "Un servicio de corte de cabello especializado para mujeres, que ofrece una variedad de estilos y técnicas adaptadas a las preferencias individuales de cada cliente, garantizando un aspecto fresco y cuidado.",
      imagePath: "assets/corte_mujer_1.jpg",
      category: "Cortes de cabello",
      subcategory: "Cortes de mujer"
    ),

    Product(
      name: "Corte mujer 2",
      price: 15,
      description: "Un servicio de corte de cabello especializado para mujeres, que ofrece una variedad de estilos y técnicas adaptadas a las preferencias individuales de cada cliente, garantizando un aspecto fresco y cuidado.",
      imagePath: "assets/corte_mujer_2.jpg",
      category: "Cortes de cabello",
      subcategory: "Cortes de mujer"
    ),

    Product(
      name: "Corte mujer 3",
      price: 15,
      description: "Un servicio de corte de cabello especializado para mujeres, que ofrece una variedad de estilos y técnicas adaptadas a las preferencias individuales de cada cliente, garantizando un aspecto fresco y cuidado.",
      imagePath: "assets/corte_mujer_3.jpg",
      category: "Cortes de cabello",
      subcategory: "Cortes de mujer"
    ),

    Product(
      name: "Corte mujer 4",
      price: 15,
      description: "Un servicio de corte de cabello especializado para mujeres, que ofrece una variedad de estilos y técnicas adaptadas a las preferencias individuales de cada cliente, garantizando un aspecto fresco y cuidado.",
      imagePath: "assets/corte_mujer_4.jpg",
      category: "Cortes de cabello",
      subcategory: "Cortes de mujer"
    ),

  ];

  final List<Product> _allProducts = [];

  Shop() {
    _allProducts.addAll(_shop);
  }

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item){
    _cart.add(item);
  }

  void removeFromCart(Product item){
    _cart.remove(item);
  }

  void filterProducts(String keyword) {
    if (keyword.isEmpty) {
      // Si el campo de búsqueda está vacío, muestra todos los productos
      _shop.clear();
      _shop.addAll(_allProducts);
    } else {
      // Filtra los productos por nombre
      _shop.clear();
      _shop.addAll(_allProducts.where((product) =>
          product.name.toLowerCase().contains(keyword.toLowerCase())));
    }
    notifyListeners();
  }
}