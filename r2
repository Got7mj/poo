import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  final List<Icon> icones;

  
  NewNavBar({required this.icones});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    final itens = icones
        .map((icone) => BottomNavigationBarItem(
              icon: icone,
              label: "", // labels vazios conforme pedido
            ))
        .toList();

    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: itens,
    );
  }
}

class DicasDeCervejas extends StatelessWidget {
  const DicasDeCervejas();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: Center(
            child: Text("La Fin Du Monde - Bock - 65 ibu"),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Duvel - Pilsner - 82 ibu"),
          ),
        ),
      ],
    );
  }
}


class MinhaAppBar extends AppBar {
  MinhaAppBar({Key? key, required String titulo})
      : super(
          key: key,
          title: Text(titulo),
        );
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false,primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: MinhaAppBar(titulo: "Dicas"),
        body: const DicasDeCervejas(),
        bottomNavigationBar: NewNavBar(
          icones: const [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined),
            Icon(Icons.star_outline),
          ],
        ),
      ),
    );
  }
}

void main() {
  MyApp app = MyApp();
  runApp(app);
}

