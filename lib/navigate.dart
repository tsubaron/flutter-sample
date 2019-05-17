import 'package:flutter/material.dart';

void navigateToScreens (int pageIndex, BuildContext context) {
  switch (pageIndex) {
    case 0:
      Navigator.of(context).pushReplacementNamed('/home');
      break;
    case 1:
      Navigator.of(context).pushReplacementNamed('/search');
      break;
  }
}

BottomNavigationBar bottomNavigation (BuildContext context) {
  return new BottomNavigationBar(
    currentIndex: 1,
    onTap: (int pageIndex) {
      navigateToScreens(pageIndex, context);
    },
    items: [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        title: new Text("ホーム"),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.search),
        title: new Text("検索"),
      ),
    ],
  );
}
