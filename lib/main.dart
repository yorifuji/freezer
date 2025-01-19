import 'package:freezer/person.dart';

void main(List<String> arguments) {
  Person('John', 30).showOutput();
  Person.fromJson({"name": "Jane", "age": 25}).showOutput();
  print(Person('John', 30).toJson());
}
