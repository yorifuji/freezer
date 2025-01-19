import 'package:freezer/person.dart';

void main(List<String> arguments) {
  var person = Person('John', 30);
  person.showOutput();

  Person.fromJson({"name": "Jane", "age": 25}).showOutput();
}
