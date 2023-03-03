class User {
  const User({
    required this.phone,
    required this.nickname,
    required this.city,
    required this.uuid,
  });
  // получаем данные с сервера
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      city: json['city'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
    );
  }
  final String phone;
  final String nickname;
  final String city;
  final String uuid;

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
