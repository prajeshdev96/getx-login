import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String? fristName, lastName, email, password, gender;

  User(
      {this.id,
      this.fristName,
      this.lastName,
      this.email,
      this.password,
      this.gender});

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        fristName = res["fname"],
        lastName = res["Lnsme"],
        email = res["email"],
        password = res["password"],
        gender = res["gender"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'fname': fristName,
      'Lnsme': lastName,
      'email': email,
      'password': password,
      'gender' : gender
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
