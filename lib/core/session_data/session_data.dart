class SessionData {
  final String id;
  SessionData({
    required this.id,
  });

  // получаем данные с сервера
  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(id: json['id'] ?? '');
  }

  // на сервер
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
