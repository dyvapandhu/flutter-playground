import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Playground'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              _sliderValue.round().toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Slider(
              label: _sliderValue.round().toString(),
              value: _sliderValue,
              max: 500,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              }),
          Expanded(
            child: GridView.count(
              crossAxisCount: 20,
              children: List.generate(_sliderValue.round(), (index) {
                return Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
