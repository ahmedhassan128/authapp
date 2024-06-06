import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/neutral_controller.dart';

class NautralView extends GetView<NeutralController> {
  const NautralView({super.key});
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
                "assets/images/neutral_stress.jpg",
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
                    'Neutral stress, or eustress, is a balanced state of arousal\n'
                    'where the stress level is optimal for performance. It can\n'
                    'enhance motivation, focus, and resilience without causing \n '
                    ' significant strain.This type of stress is often experienced\n'
                    'during engaging activities that challenge but do not\n'
                    'overwhelm an individual. Properly managed, neutral stress \n'
                    ' can foster growth learning, and productivity.\n',
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