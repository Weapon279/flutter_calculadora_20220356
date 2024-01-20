import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 44, 199, 140),
        useMaterial3: true,
      ),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 4;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Utem'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: const TabBar( //Para poner barras y pestañas
            tabs: <Widget>[ // Este widget sirve para poner una pestaña
              Tab(
                icon: Icon(Icons.audiotrack),
                text: 'Musica',
              ),
              
              Tab(
                icon: Icon(Icons.beach_access_sharp),
                text: 'Vacaciones',
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
                text: 'Configuracion',
              ),
              Tab(
                icon: Icon(Icons.add_circle),
                text: 'Nueva Pestaña',
              ),
            ],
          ),
        ),
        body: const TabBarView( //Para poner las vistas de cada pestaña
          children: <Widget>[ //Este widget sirve para crear títulos
            PageContent(titles: ['Musica'], additionalText: 'Los Utems'),//Sirve para mostrar el contenido de cada pestaña
            PageContent(titles: ["Musica"], additionalText: 'Los Utems'),
            PageContent(titles: ['Vacaciones'], additionalText: 'Semana Santa'),
            PageContent(titles: ['Vacaciones'], additionalText: 'Navidad'),
            PageContent(titles: ['Configuracion'], additionalText: 'Apps'),
            PageContent(titles: ['Configuracion'], additionalText: 'Herramientas'),
            PageContent(titles: ['Nuevo Nombre 1'], additionalText: 'Clima'),
            PageContent(titles: ['Nuevo Nombre 1'], additionalText: 'Ubicacion'),
          ],
        ),
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final List<String> titles;
  final String additionalText;

  const PageContent({Key? key, required this.titles, required this.additionalText}) : super(key: key);

  @override
  Widget build(BuildContext context) { //Este widget funciona para darle diseño y columnas
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ListView.builder( //Crea una lista interactiva
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: Column(
            children: [
              Text('${titles[0]} $index'),
              const SizedBox(height: 8),
              Text(additionalText, style: const TextStyle(color: Color.fromARGB(255, 226, 97, 97))),
            ],
          ),
        );
      },
    );
  }
}
