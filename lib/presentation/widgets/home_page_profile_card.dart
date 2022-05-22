import 'package:flutter/material.dart';
import 'package:orbis_task/extensions/string.dart';
import 'package:orbis_task/model/args/profile_argument.dart';
import 'package:orbis_task/model/user.dart';

class HomePageProfileCard extends StatelessWidget {
  final User user;

  const HomePageProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/profile', arguments: ProfileArgument(user.login)),
      child: Container(
        width: MediaQuery.of(context).size.width * .40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Card(
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: 80,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(user.avatarUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(user.login.capitalize(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Description',
                      style: TextStyle(
                        color: Colors.grey[600],
                      )),
                  const Divider(color: Colors.grey),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                      ),
                      Text('2 new courses',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
