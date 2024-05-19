import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/low_trust_controller.dart';

class LowTrustView extends GetView<LowTrustController> {
  const LowTrustView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LowTrustView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LowTrustView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
