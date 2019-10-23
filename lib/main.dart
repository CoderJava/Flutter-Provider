import 'package:flutter/material.dart';
import 'package:flutter_provider/counter.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>.value(
      value: Counter(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider'),
      ),
      body: Center(
        child: WidgetNumber(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Provider.of<Counter>(context).increment();
            },
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              Provider.of<Counter>(context).decrement();
            },
          ),
        ],
      ),
    );
  }
}

class WidgetNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text(
      '${counter.count}',
      style: Theme.of(context).textTheme.display1,
    );
  }
}
