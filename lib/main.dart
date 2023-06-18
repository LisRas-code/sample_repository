import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> animation;
  bool mode_change_switch = true;

  Future<void> setAnimation() async {
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    Tween<Alignment> tween = Tween(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(1.0, 1.0),
    );
    animation = _controller.drive(tween);
  }

  @override
  void initState() {
    setAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app'),
      ),
      body: Container(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height / 2) -
            AppBar().preferredSize.height,
        color: Colors.amber,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return Align(
              alignment: animation.value,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purple[200],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mode_change_switch ? _controller.forward() : _controller.reverse();
          mode_change_switch = !mode_change_switch;
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.animation,
          color: Colors.white,
        ),
      ),
    );
  }
}
