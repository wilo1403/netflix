import 'package:flutter/material.dart';

class CallToActions extends StatelessWidget {
  const CallToActions({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final List tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          tags.join(' . '),
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Icon(Icons.add),
                Text(
                  '     Mi lista     ',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
              label: const Text(
                'Reproducir',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: const [
                Icon(Icons.info),
                Text(
                  'Información',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
