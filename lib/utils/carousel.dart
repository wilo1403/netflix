import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  final List type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            // 'Lanzamientos del último año',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...type
                  .map(
                    (items) => Stack(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 170,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(items['cover']),
                                ),
                              ),
                              child: Container(),
                            ),
                          ),
                        ),
                        (items['top'])
                            ? Positioned(
                                right: 0,
                                child: Image.asset("assets/top.png"),
                              )
                            : Container(),
                        (items['new_chapter'])
                            ? Positioned(
                                bottom: 10,
                                left: 15,
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 15,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                        ),
                                        child: const Text(
                                          'CADA SEMANA',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 15,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          'UN EPISODIO NUEVO',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
