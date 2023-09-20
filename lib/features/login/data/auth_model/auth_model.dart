import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final bool status;
  final String message;
  final UserData? data;

  const AuthModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json['status'] as bool,
        message: json['message'] as String,
        data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class UserData extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        image: json['image'] as String,
        points: json['points'] == null ? 0 : json['points'] as int,
        credit: json['credit'] == null ? 0 : json['credit'] as int,
        token: json['token'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        image,
        points,
        credit,
        token,
      ];
}
