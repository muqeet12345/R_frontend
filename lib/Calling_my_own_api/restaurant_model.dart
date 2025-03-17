class Restaurant {
  final String title;
  final String address;
  final String status;

  Restaurant({required this.title, required this.address, required this.status});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      title: json['title'],
      address: json['address'],
      status: json['status'],
    );
  }
}
