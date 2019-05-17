import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../navigate.dart';
import '../storage/Budgets.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _sum = 0;
  var _directDebitAreaCount = 0;
  var _directDebitCount = 0;
  var _directDebitBudgets;
  String _date;
  BudgetsProvider _budgetsProvider;

  _HomePageState() {
    init();
  }

  init () async {
    this._budgetsProvider = new BudgetsProvider();
    await this._budgetsProvider.open();

    initializeDateFormatting("ja_JP");
    var formatter = new DateFormat('yyyyMM', "ja_JP");
    this._date = formatter.format(new DateTime.now());

    this._reload();
  }

  void _reload() async {
    this._directDebitCount = await _budgetsProvider.countByDateAndType(
      date: this._date,
      type: Budgets.typeDirectDebit
    );
    this._directDebitBudgets = await _budgetsProvider.getByDateAndType(
      date: this._date,
      type: Budgets.typeDirectDebit
    );
    this._directDebitAreaCount = this._directDebitCount + 5;
    print(this._directDebitAreaCount);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        title: Text('aa'),
      ),
      body:
        Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("aa"),
                Text("bb"),
              ],
          ),
      bottomNavigationBar: bottomNavigation(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
