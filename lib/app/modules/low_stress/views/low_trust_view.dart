import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/low_trust_controller.dart';

class LowStressView extends GetView<LowStresstController> {
  const LowStressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 148, 183),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 252, 148, 183),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 300,
              child: Image.asset(
                "assets/images/Low_stress.jpg",
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
                    'Low stress is a state of minimal mental or emotional strain\n'
                    'strain,typically associated with a relaxed and calm mindset\n '
                    'It promotes better focus,enhanced mood,and improved to\n '
                    'physicalhealth Maintaining low stress levels can lead \n'
                    'increased productivity and a greater sense of well-being.\n '
                    'Techniques such as mindfulness, regular exercise,and \n'
                    'adequate  rest help sustain low stress.\n',
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
