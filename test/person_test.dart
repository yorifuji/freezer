import 'package:freezer/person.dart';
import 'package:test/test.dart';

void main() {
  test('person', () {
    expect(Person('John', 30).name, 'John');
    expect(Person('John', 30).age, 30);
  });
}
