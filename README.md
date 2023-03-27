[![pub package](https://img.shields.io/pub/v/rotating_shape.svg)](https://pub.dartlang.org/packages/rotating_shape)


Rotating shape animator 

<img src="https://github.com/ehsanemamipour/rotating_shape/blob/main/screenshots/rotating_shape.gif" height="15%" alt="example" style="width: 35%; display: inline-block;" data-target="animated-image.originalImage">

## Features

<p dir="auto"><strong>Animated dynamic sequences</strong></p>

<p dir="auto">The widget can help you build a better UI in your next app by animating any widget you have.</p>

<p dir="auto"><strong>Easily configurable widget</strong></p>

<p dir="auto">You can customize everything in this widget.</p>

<p dir="auto"><strong>Invert the animation</strong></p>

<p dir="auto">Choose the animation direction</p>

## Installing

In your `pubspec.yaml` file add:

``` yaml
dependencies:
  rotating_shape: any
```

In your code import and use the package:

``` dart
import 'package:rotating_shape/rotating_shape.dart';
```

## Usage

``` dart
RotatingShape(
  size: 20,
  itemsDistance: 5,
  itemCount: 5,
  shape: Shape.rectangle,
  reverse: true,
  color: Colors.red,
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey[200],
    ),
    child: Icon(
      Icons.home,
      color: Colors.deepOrange[200],
      size: 10,
    ),
  ),
);        
```

See the full example <a href="https://github.com/ehsanemamipour/rotating_shape/tree/main/example">rotating shape</a>.
