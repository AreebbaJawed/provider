import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counterProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:  
      // ChangeNotifierProvider<Counter>(  //with change notifier
      ChangeNotifierProvider<ValueNotifier<int>>( // with value notifier
          // create: (context) => Counter(), //with change notifier
          create: (context) => ValueNotifier<int>(0), // with value notifier
          child: MyHomePage(title: 'Flutter Counter With Provider')),
    );
  }
}

class MyHomePage extends StatelessWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<Counter>(context, listen: false); //with change notifier
    final counter = Provider.of<ValueNotifier<int>>(context, listen: false); // with value notifier
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Consumer<Counter>( //with change notifier
            Consumer<ValueNotifier<int>>( //with value notifier
              builder: (_, counter, __) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: counter.increment, //with change notifier
        onPressed: () => counter.value++, //with value notifier
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
