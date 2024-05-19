import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/medium_trust_controller.dart';

class MediumTrustView extends GetView<MediumTrustController> {
  const MediumTrustView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediumTrustView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MediumTrustView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
