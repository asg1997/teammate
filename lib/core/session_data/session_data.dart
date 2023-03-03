class SessionData {
  SessionData({
    required this.id,
  });
  // получаем данные с сервера
  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(id: json['id'] as String? ?? '');
  }
  final String id;

  // на сервер
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
