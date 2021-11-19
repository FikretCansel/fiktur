class AuthResponse {
  final int userId;
  final String firstName;
  final String lastName;
  final String token;
  final DateTime expiration;


  AuthResponse({
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.token,
    required this.expiration,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userId: json['userId'],
      token: json['token'],
      expiration: DateTime.parse(json['expiration']) ,
    );
  }




}