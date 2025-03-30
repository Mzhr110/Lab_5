import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationExample(),
    );
  }
}

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  double _borderRadius = 10;
  bool _isVisible = true;

  void _animateContainer() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius = _borderRadius == 10 ? 50 : 10;
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 10, 2),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Flutter AnimateX",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: _animateContainer,
              child: Text("Animate!"),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _isVisible ? 1.0 : 0.0,
              child: Text(
                "Mazhar Abbas",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: _toggleVisibility,
              child: Text("Toggle Visibility"),
            ),
          ],
        ),
      ),
    );
  }
}
