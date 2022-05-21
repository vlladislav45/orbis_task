import 'package:flutter/material.dart';
import 'package:orbis_task/model/args/profile_argument.dart';
import 'package:orbis_task/model/user.dart';

class HomePageProfileCard extends StatelessWidget {
  final User user;

  const HomePageProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/profile', arguments: ProfileArgument(user.login)),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          width: MediaQuery.of(context).size.width * .40,
          child: Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(user.avatarUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Text(user.login),
                  Text('DESCRIPTION'),
                  const Divider(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('2 new courses'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
