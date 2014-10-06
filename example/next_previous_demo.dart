import 'package:polymer/polymer.dart';
import 'package:next_previous_element/next_previous.dart';

class Person extends Observable {
  String name = "";
  String phone = "";
  String address = "";

  Person(this.name, this.phone, this.address);
}
/**
 * demonstrates the use of next-previous element.
 */
@CustomTag('next-previous-demo')
class NextPreviousDemo extends PolymerElement {

  @published Person person;

  List<Person> people = samplePeople();

  static List<Person> samplePeople() {
    var list = new List<Person>();
    list.add(new Person("Jim", "BE2626", "Bellevue"));
    list.add(new Person("Sally", "GR4743", "Granite"));
    list.add(new Person("Patty", "DN2006", "Dunham"));
    return list;
  }

  NextPreviousDemo.created() : super.created() {
  }

  void domReady() {
    super.domReady();
    person = people[0];
    nextPreviousElement
        ..currentIndex = 0
        ..totalCount = people.length;
  }

  NextPrevious get nextPreviousElement => ($['nextPrev'] as NextPrevious);

  void nextPerson() {
    person = people[nextPreviousElement.currentIndex];
  }

  void previousPerson() {
    person = people[nextPreviousElement.currentIndex];
  }
}
