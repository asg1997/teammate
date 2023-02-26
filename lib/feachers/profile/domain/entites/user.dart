class User {
  final String phone;
  final String nickname;
  final String city;
  final String uuid;
  const User({
    required this.phone,
    required this.nickname,
    required this.city,
    required this.uuid,
  });

  // получаем данные с сервера
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        phone: json['phone'] ?? '',
        nickname: json['nickname'] ?? '',
        city: json['city'] ?? '',
        uuid: json['uuid'] ?? '');
  }

  // на сервер
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'nickname': nickname,
      'city': city,
      'uuid': uuid,
    };
  }
}
