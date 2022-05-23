
class Project {
  late int id;
  late String name;
  late String body;
  late int number;

  Project({required this.id, required this.name, required this.body, required this.number});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    number = json['number'];
  }

}