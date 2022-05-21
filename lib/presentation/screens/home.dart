
import 'package:flutter/material.dart';
import 'package:orbis_task/api/user_api.dart';
import 'package:orbis_task/presentation/widgets/home_screen_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 30, 8.0, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Classes', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

                  Text('icon'),
                ],
              ),

              const SizedBox(height: 20.0),

              const HomeScreenHeader(),
            ],
          ),
        )
    );
  }
}
