import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/high_trust_controller.dart';

class HighTrustView extends GetView<HighTrustController> {
  const HighTrustView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HighTrustView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Image Loaded Successfully",
          style: TextStyle(fontSize: 20, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
