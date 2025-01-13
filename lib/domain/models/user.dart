
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({

    required String name,
    required String lastName,
    required String email,
    String? dateOfBirth,
    required String genre,

  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

}