import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantController extends GetxController {
  var restaurantData = {}.obs;
  var isLoading = true.obs;

  Future<void> fetchRestaurant() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse("http://192.168.1.7:3000/restaurant"));

      if (response.statusCode == 200) {
        restaurantData.value = json.decode(response.body);
      } else {
        Get.snackbar("Error", "Failed to load restaurant data");
      }
    } catch (e) {
      Get.snackbar("Error", "Connection failed: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchRestaurant();
    super.onInit();
  }
}
