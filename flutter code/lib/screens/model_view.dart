import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class ModelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        body: ModelViewer(
          src: 'assets/tiger.glb',
          alt: "A 3D model of a leopard",
          ar: true,
          autoRotate: true,
          autoPlay: true,
          cameraControls: true,
        ),
      ),
    );
  }
}
