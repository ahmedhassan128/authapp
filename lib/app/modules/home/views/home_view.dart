import 'dart:io';
import 'package:authapp/app/modules/login/controllers/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.signOut();
        },
        child: const Text("Logout"),
      ),
      backgroundColor: const Color.fromARGB(255, 252, 148, 183),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        Text(
                          controller.userName.value,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: controller.selectedImagePath.value.isEmpty
                              ? const Center(
                                  child: Text('No image selected',
                                      style: TextStyle(color: Colors.pink)))
                              : Image.file(
                                  File(
                                    controller.selectedImagePath.value,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 42,
                          child: PrimaryButton(
                            text: "Select image",
                            onTap: () {
                              controller.ImagesourceDialog();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text(
                                'ID',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Date+Time',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Response',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            controller.contactList.length,
                            (index) {
                              final listdata = controller.contactList[index];
                              String datetime =
                                  listdata['datetime'] ?? 'No datetime';
                              String formattedDate = 'Invalid date';

                              try {
                                DateTime parsedDate = DateTime.parse(datetime);
                                formattedDate =
                                    DateFormat('yyyy-MM-dd HH:mm:ss')
                                        .format(parsedDate);
                              } catch (e) {
                                print('Error parsing date: $e');
                              }

                              return DataRow(cells: [
                                DataCell(Text((index + 1).toString())),
                                DataCell(Text(formattedDate)),
                                DataCell(Text(
                                    listdata['predicted_class'] ?? 'No class')),
                              ]);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
