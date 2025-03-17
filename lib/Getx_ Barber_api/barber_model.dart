class Barber {
  final int id;
  final String name;
  final double averageRating;
  final String profilePic;
  final String address;
  final List<Service> services;
  final Map<String, List<Availability>> availability;

  Barber({
    required this.id,
    required this.name,
    required this.averageRating,
    required this.profilePic,
    required this.address,
    required this.services,
    required this.availability,
  });

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      id: json['id'],
      name: json['name'],
      averageRating: json['averageRating'].toDouble(),
      profilePic: json['profilePic'],
      address: json['address'],
      services: (json['barberServices'] as List)
          .map((service) => Service.fromJson(service))
          .toList(),
      availability: (json['userAvailability']['availableDays'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(
          key,
          (value as List).map((item) => Availability.fromJson(item)).toList(),
        ),
      ),
    );
  }
}

class Service {
  final int id;
  final double price;
  final String categoryName;
  final String categoryIcon;

  Service({required this.id, required this.price, required this.categoryName, required this.categoryIcon});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      price: json['servicePrice'].toDouble(),
      categoryName: json['category']['categoryName'],
      categoryIcon: json['category']['categoryIcon'],
    );
  }
}

class Availability {
  final String day;
  final String start;
  final String end;

  Availability({required this.day, required this.start, required this.end});

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      day: json['day'],
      start: json['start'],
      end: json['end'],
    );
  }
}
