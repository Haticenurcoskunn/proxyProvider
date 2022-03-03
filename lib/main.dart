import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String firstTitle = "You clicked the button";
  String secondTitle = "times";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _increaseCounter() {
    setState(
      () {
        _counter++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MultiProvider(
          providers: [
            ProxyProvider0<int>(
              update: ((context, value) => _counter),
            ),
            ProxyProvider<int, Translation>(
              update: (_, counter, __) => Translation(counter),
            ),
          ],
          child: const CounterWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translation = Provider.of<Translation>(context);
    return Text(
      translation.title,
    );
  }
}

class Translation {
  const Translation(this._value);
  final int _value;
  String get title => 'You clicked $_value times';
}
