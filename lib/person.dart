import 'package:freezer/freezer.dart';
import 'package:json/json.dart';

@JsonCodable()
@Freezer()
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  void showOutput() {
    print('$name is $age years old.');
  }
}
