class BasicDetailsModel {
  final int id;
  final String name;
  final String apiDetailUrl;
  final String? role;

  BasicDetailsModel({
    required this.id,
    required this.name,
    required this.apiDetailUrl,
    this.role,
  });

  factory BasicDetailsModel.fromJson(Map<String, dynamic> json) {
    return BasicDetailsModel(
      id: json['id'],
      name: json['name'],
      apiDetailUrl: json['api_detail_url'],
      role: json['role'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'api_detail_url': apiDetailUrl,
      'role': role,
    };
  }
}
