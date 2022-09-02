import 'package:flutter/material.dart';
import 'package:netflix/utils/carousel.dart';
import 'package:netflix/screens/widgets.dart';
import 'package:netflix/utils/call_to_actions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List categories = [
      'Acción',
      'Aventuras',
      'Ficción',
      'Comedias',
      'Dramas',
      'Animadas',
    ];

    List tags = [
      'Logrado',
      'Anime de drama',
      'Apuestas',
      'De Japón',
      'Manga',
      'Serie',
    ];

    List lastYear = [
      {'top': true, 'cover': 'assets/bcs.png', 'new_chapter': true},
      {'top': false, 'cover': 'assets/the-sandman.png', 'new_chapter': true},
      {'top': false, 'cover': 'assets/Cobra_Kai.png', 'new_chapter': false},
    ];

    List tendency = [
      {'top': true, 'cover': 'assets/bb.png', 'new_chapter': false},
      {'top': true, 'cover': 'assets/bety.png', 'new_chapter': false},
      {'top': true, 'cover': 'assets/casa-de-papel.png', 'new_chapter': false},
    ];

    int selectedIndex = 0;

    List navigatorItems = [
      {'label': 'Inicio', 'icon': Icons.home, 'notifications': 0},
      {'label': 'Juegos', 'icon': Icons.sports_esports, 'notifications': 2},
      {'label': 'Nuevo y popular', 'icon': Icons.movie, 'notifications': 9},
      {
        'label': 'Para reir',
        'icon': Icons.sentiment_satisfied_alt,
        'notifications': 0
      },
      {'label': 'Descargas', 'icon': Icons.downloading, 'notifications': 0},
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: const AppBarCustom(),
      body: Column(
        children: [
          Container(
            height: 390,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_netflix.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 87,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.70),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Series',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Peliculas',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        child: DropdownButton(
                          dropdownColor: Colors.black,
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          hint: Text(
                            'Categorias',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          isExpanded: false,
                          items: categories.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 178,
                ),
                CallToActions(tags: tags),
              ],
            ),
          ),
          Carousel(
            title: 'Lanzamientos del último año',
            type: lastYear,
          ),
          Carousel(
            title: 'Tendencias',
            type: tendency,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        iconSize: 30.0,
        unselectedFontSize: 10.0,
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 0.3,
          size: 30.0,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 1,
          size: 30.0,
        ),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 253, 253, 252),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        items: [
          ...navigatorItems.map(
            (items_) => BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(items_['icon']),
                  Positioned(
                    right: 0,
                    child: (items_['notifications'] > 0)
                        ? Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              items_['notifications'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
              label: items_['label'],
            ),
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white.withOpacity(0.90),
        child: const RadiantGradientMask(
          child: Icon(
            Icons.shuffle,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [
          Colors.blue,
          Colors.pinkAccent,
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
