import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username, avatar, email, id;
  final String? password;

// required constructor
  const UserEntity({
    required this.id,
    required this.username,
    required this.avatar,
    required this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        avatar,
        email,
        password
      ];
}

