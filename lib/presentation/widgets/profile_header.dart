import 'package:flutter/material.dart';
import 'package:orbis_task/model/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 110,
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Stack(
                  children: [
                  Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(user.avatarUrl),
                          ),
                        ),
                      ),
                    Positioned(
                      right: 0,
                      top: -5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () => {
                        Navigator.pop(context),
                      },
                  icon: const Icon(Icons.close),
                  color: Colors.black),
            ],
          ),
          SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.black),
                ),
              ),
              Text(
                'DESCRIPTION',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        )),
                  ),
                  onPressed: () {},
                  child: Text('Book class | s1,300.00'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Colors.grey[300],
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.grey[300] ?? Colors.grey,
                          width: 1.0,
                        )),
                  ),
                  child: Text('Follow'),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Statistics(),
        ],
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Statistic(),
          SizedBox(
            height: 20,
            child: VerticalDivider(
              color: Colors.grey[600],
            ),
          ),
          Statistic(),
          SizedBox(
            height: 20,
            child: VerticalDivider(
              color: Colors.grey[600],
            ),
          ),
          Statistic(),
        ],
      ),
    );
  }
}

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Students', style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey[600])),
        Text('35,789', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
