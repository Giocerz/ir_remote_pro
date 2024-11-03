import 'package:flutter/material.dart';
import 'package:ir_remote_pro/presentation/pages/DeviceSelect/DeviceSelect.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _openDeviceSelect() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DeviceSelect()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(icon: const Icon(Icons.add), onPressed: _openDeviceSelect,),
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.settings))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}