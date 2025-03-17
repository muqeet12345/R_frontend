import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Getx_ Barber_api/barber_controller.dart';

class BarberView extends StatelessWidget {
  final BarberController barberController = Get.put(BarberController());

  BarberView() {
    barberController.fetchBarberDetails(19); // Fetch barber details on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barber Details")),
      body: Obx(() {
        var barber = barberController.barber.value;

        return barber == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(barber.profilePic),
                ),
              ),
              SizedBox(height: 10),
              Text("Name: ${barber.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Address: ${barber.address}", style: TextStyle(fontSize: 18)),
              Text("Rating: ⭐ ${barber.averageRating}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Services:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Column(
                children: barber.services.map((service) {
                  return ListTile(
                    leading: Image.network(service.categoryIcon, width: 40),
                    title: Text(service.categoryName),
                    subtitle: Text("\$${service.price.toStringAsFixed(2)}"),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text("Availability:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Column(
                children: barber.availability.entries.map((entry) {
                  if (entry.value.isEmpty) return Container();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(entry.key, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Column(
                        children: entry.value.map((avail) {
                          return Text("${avail.start} - ${avail.end}");
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
}