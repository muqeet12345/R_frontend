import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:r_tech/Getx_%20Barber_api/barber_model.dart';
import 'dart:convert';

class BarberController extends GetxController {
  var isLoading = true.obs;
  var barber = Rxn<Barber>(); // Rxn allows null safety

  Future<void> fetchBarberDetails(int barberId) async {
    try {
      isLoading(true);
      var url = "https://barberbackend-production-4738.up.railway.app/api/v2/user/barbers?barberId=$barberId";
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        barber.value = Barber.fromJson(data['barber']);
      } else {
        Get.snackbar("Error", "Failed to load data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
