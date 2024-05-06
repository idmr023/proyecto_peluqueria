// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:PeluqueriaYvette/components/my_list_title.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key? key}) : super(key: key); // Corrección en la declaración del constructor

  Future<void> _launchURL() async {
    const url = 'https://www.stack-ai.com/public_chatbot/cbdc200a-77e3-4d0f-9079-c71e1ccf8d38/8f8910a1-1ca9-4ca2-bedb-e81ac7e9f853/656781de61ce4df14386b4dc';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'No se puede abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Column(children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              MyListTitle(
                text: "Tienda", 
                icon: Icons.home, 
                onTap: () => Navigator.pop(context),
              ),

              MyListTitle(
                text: "Catálogo", 
                icon: Icons.shopping_cart, 
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              MyListTitle(
                text: "Pelu Chat",
                icon: Icons.chat,
                onTap: () {
                  _launchURL();
                },
              ),
            ]), // Aquí se añade el corchete de cierre que falta
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: MyListTitle(
                text: "Salir", 
                icon: Icons.logout, 
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
              ),
            ),
          ],
        ),
    );
  }
}
