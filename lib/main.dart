import 'package:freezer/person.dart';

void main(List<String> arguments) {
  Person(name: 'John', age: 30).showOutput();
  Person.fromJson({"name": "Jane", "age": 25}).showOutput();
  print(Person(name: 'John', age: 30).toJson());
  print(Person(name: 'John', age: 30) == Person(name: 'John', age: 30));
}
