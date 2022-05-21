
class User {
  late int id;
  late String login;
  late String avatarUrl;

  User({required this.id, required this.login, required this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      login = json['login'];
      avatarUrl = json['avatar_url'];
     }

}