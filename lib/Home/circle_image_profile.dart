import 'package:flutter/material.dart';

class CircularImageProfile extends StatelessWidget {
  final double _width, _height;
  final ImageProvider image;

  CircularImageProfile(this.image, {double width = 300, double height = 300})
      : _width = width,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: image),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black45,
            )
          ]),
    );
  }
}
