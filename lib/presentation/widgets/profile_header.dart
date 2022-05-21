
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '@johndoe',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
