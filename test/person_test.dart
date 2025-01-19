import 'package:freezer/person.dart';
import 'package:test/test.dart';

void main() {
  test('person', () {
    expect(Person(name: 'John', age: 30).name, 'John');
    expect(Person(name: 'John', age: 30).age, 30);
  });
}
