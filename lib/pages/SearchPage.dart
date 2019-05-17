import 'package:flutter/material.dart';
import '../navigate.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('わかりみ'),
      ),
      bottomNavigationBar: bottomNavigation(context),
    );
  }
}
