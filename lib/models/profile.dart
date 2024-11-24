import 'package:objectbox/objectbox.dart';

@Entity()
class Profile {
  int id;
  String name;
  String phone;
  String location;
  String password;

  Profile(
      {this.id = 0,
      required this.name,
      required this.phone,
      required this.location,
      required this.password});
}
