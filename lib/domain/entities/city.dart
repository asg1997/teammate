class City {
  City({required this.name, required this.region});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['city'] as String,
      region: json['region'] as String,
    );
  }

  final String name;
  final String region;

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
      };
}
