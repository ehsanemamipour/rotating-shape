import 'package:flutter/material.dart';
import 'package:rotating_shape/rotating_shape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RotatingShape(
                    size: 20,
                    itemsDistance: 5,
                    itemCount: 5,
                    shape: Shape.rectangle,
                    reverse: true,
                    color: Colors.red,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Icon(
                        Icons.home,
                        color: Colors.deepOrange[200],
                        size: 10,
                      ),
                    ),
                  ),
                  RotatingShape(
                    size: 20,
                    itemsDistance: 5,
                    itemCount: 1,
                    shape: Shape.rectangle,
                    reverse: true,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Icon(
                        Icons.home,
                        color: Colors.deepOrange[200],
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RotatingShape(
                    size: 50,
                    itemsDistance: 10,
                    itemCount: 5,
                    shape: Shape.custom,
                    color: Colors.orange,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Icon(
                        Icons.face,
                        color: Colors.deepOrange[200],
                        size: 25,
                      ),
                    ),
                  ),
                  RotatingShape(
                    size: 50,
                    itemsDistance: 10,
                    itemCount: 1,
                    shape: Shape.custom,
                    color: Colors.pink,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: const Icon(
                        Icons.home,
                        color: Colors.pink,
                        size: 25,
                      ),
                    ),
                  ),
                  RotatingShape(
                    size: 50,
                    itemsDistance: 10,
                    itemCount: 10,
                    shape: Shape.custom,
                    color: Colors.blue,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: const Icon(
                        Icons.pedal_bike,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List<Widget>.generate(
                    8,
                    (index) => RotatingShape(
                      size: 30,
                      itemsDistance: 10,
                      itemCount: 1,
                      shape: Shape.polygon,
                      polygonSides: index + 3,
                      paintingStyle: PaintingStyle.stroke,
                      color: Colors.yellow[(index + 2) * 100] ?? Colors.yellow,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[200]),
                        child: Icon(
                          Icons.home,
                          color: Colors.deepOrange[200],
                          size: 5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List<Widget>.generate(
                    8,
                    (index) => RotatingShape(
                      size: 20,
                      itemsDistance: 10,
                      itemCount: 3,
                      shape: Shape.polygon,
                      polygonSides: index + 3,
                      paintingStyle: PaintingStyle.stroke,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[200]),
                        child: const Icon(
                          Icons.home,
                          color: Colors.green,
                          size: 5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List<Widget>.generate(
                    4,
                    (index) => RotatingShape(
                      size: 50,
                      itemsDistance: 10,
                      itemCount: index + 1,
                      shape: Shape.polygon,
                      polygonSides: 8,
                      paintingStyle: PaintingStyle.stroke,
                      autoPolygon: true,
                      color: Colors.yellow[(index + 5) * 100] ?? Colors.yellow,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[200]),
                        child: Icon(
                          Icons.home,
                          color: Colors.deepOrange[200],
                          size: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
