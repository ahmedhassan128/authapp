import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/high_stress_controller.dart';

class HighStressView extends GetView<HighStressController> {
  const HighStressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 300,
              child: Image.asset(
                "assets/images/high_stress.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    "Discription",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    'High stress is an intense state of mental or emotional strain\n'
                    'resulting from demanding circumstances.It often manifests as\n '
                    'anxiety,irritability It often manifests and physicalsymptoms\n'
                    'like headaches or fatigue.Prolonged high stress can impairand\n'
                    'cognitive function, reduce productivity,harm overallwell-being.\n'
                    'Effective stress management techniques are essential for \n'
                    'maintaining  health and performance.',
                    style:
                        TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
