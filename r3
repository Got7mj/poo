import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: NewAppBar(), // Usando a nova AppBar personalizada
        body: DataBodyWidget(
          objects: const [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu",
          ],
        ),
        bottomNavigationBar: NewNavBar(
          icons: const [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined),
          ],
        ),
      ),
    );
  }
}

// Nova AppBar como subclasse
class NewAppBar extends AppBar {
  NewAppBar({Key? key})
      : super(
          key: key,
          title: const Text("Dicas"),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (String value) {
                print('Selecionou: $value');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "Vermelho",
                  child: Text("Vermelho"),
                ),
                PopupMenuItem<String>(
                  value: "Verde",
                  child: Text("Verde"),
                ),
                PopupMenuItem<String>(
                  value: "Azul",
                  child: Text("Azul"),
                ),
              ],
            ),
          ],
        );
}

class NewNavBar extends StatelessWidget {
  final List<Icon> icons;

  NewNavBar({required this.icons});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    final items = icons
        .map(
          (icon) => BottomNavigationBarItem(
            icon: icon,
            label: '',
          ),
        )
        .toList();

    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: items,
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  DataBodyWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects
          .map(
            (obj) => Expanded(
              child: Center(child: Text(obj)),
            ),
          )
          .toList(),
    );
  }
}
