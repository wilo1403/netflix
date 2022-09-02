import 'package:flutter/material.dart';

// import 'package:netflix/theme/app_theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.black.withOpacity(0.70),
      leading: Image.asset(
        'assets/netflix-logo.png',
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.network(
              'https://e-cdns-images.dzcdn.net/images/user/072309e46e4ef676c6601875bfaaa3a6/528x528-000000-80-0-0.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        //
      ],
      leadingWidth: 50,
    );
  }
}
