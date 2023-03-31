import 'package:flutter/material.dart';

class DotGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dot Game'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Stack(
            children: [
              _buildDot(50, 50),
              _buildDot(100, 100),
              _buildDot(200, 200),
              _buildDot(250, 250),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(double x, double y) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
