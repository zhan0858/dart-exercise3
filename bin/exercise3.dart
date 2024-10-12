import 'dart:convert' as convert;

void main(List<String> arguments) {
  String studentsInfo = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';
  var decodedJson = convert.jsonDecode(studentsInfo) as List<dynamic>;
  List<Map<String, String>> studentsList = [];
  studentsList.addAll(decodedJson.map((item) => Map<String, String>.from(item)));
  Students sList = Students(studentsList);
  print('List ==========================');
  sList.output();
  print('Sorted List ===================');
  sList.sort('first');
  sList.output();
  print('Plus people ===================');
  Map<String, String> person = {"first":"John", "last":"Doe", "email":"John@gmail.com", "age":"25"};
  sList.plus(person);
  sList.output();
  print('Remove1 =================');
  sList.remove1('first', 'Adesh');
  sList.output();
  print('Remove2 =================');
  sList.remove2('age');
  sList.output();

}

class Students{

  List<Map<String, String>> people = [];

  Students(this.people);

  void sort(String field){
    if (people.isNotEmpty && people.first.containsKey(field)) {
      people.sort((a, b) => a[field]!.compareTo(b[field]!));
    } else {
      print(" '$field' does not exist in the list.");
    }
  }

  void output(){                                      
    people.forEach((item) {
      print(item); // this one is more clear to see the output
      // print("${item['first']}${' '}${item['last']}'s email is ${item['email']}");
    });
  }

  void plus(Map<String, String> person){
    people.add(person);
  }

  void remove1(String field, String value){
    people.removeWhere((item) => item[field] == value);
  }

  void remove2(String field){
    people.removeWhere((item) => item.containsKey(field));
  }

}
