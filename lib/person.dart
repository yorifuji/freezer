import 'package:json/json.dart';

@JsonCodable()
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void showOutput() {
    print('$name is $age years old.');
  }
}
