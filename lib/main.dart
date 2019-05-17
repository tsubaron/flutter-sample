import 'package:flutter/material.dart';
import './navigate.dart';
import './pages/HomePage.dart';
import './pages/SearchPage.dart';

void main() => runApp(MyApp());

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return new FadeTransition(opacity: animation, child: child);
  }
}


class MyApp extends StatelessWidget {
  Color _primaryColor = Colors.deepOrange;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAVING',
      theme: ThemeData(
        primarySwatch: this._primaryColor,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 24.0, fontFamily: 'Hind', fontWeight: FontWeight.bold, color: this._primaryColor),
          title: TextStyle(fontSize: 18.0, fontFamily: 'Hind', fontStyle: FontStyle.italic, color: this._primaryColor),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: this._primaryColor),
          body2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.red),
        ),
      ),
      home: HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home': return new MyCustomRoute(
            builder: (_) => new HomePage(),
            settings: settings,
          );
          case '/search': return new MyCustomRoute(
            builder: (_) => new SearchPage(),
            settings: settings,
          );
        }
        assert(false);
      }
    );
  }
}
