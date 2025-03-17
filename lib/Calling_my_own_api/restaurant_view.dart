import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_tech/Calling_my_own_api/restaurant_controller.dart';

class HomeView extends StatelessWidget {
  final RestaurantController controller = Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurant Info")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name: ${controller.restaurantData['title']}"),
              Text("Address: ${controller.restaurantData['address']}"),
              Text("Status: ${controller.restaurantData['status']}"),
            ],
          ),
        );
      }),
    );
  }
}
