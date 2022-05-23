import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:orbis_task/model/user.dart';
import 'package:orbis_task/model/view/statistic.dart' as StatisticModel;
import 'package:intl/intl.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

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
                padding: const EdgeInsets.only(top: 10, right: 10),
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
                      right: -5,
                      top: -5,
                      child: ClipPath(
                        clipper: StarClipper(14),
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
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
                  child: const  Text('Follow'),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          _Statistics(),
        ],
      ),
    );
  }
}

class _Statistics extends StatelessWidget {
  final List<StatisticModel.Statistic> _statistics = [
    StatisticModel.Statistic(index: 0, title: 'Students', count: 35789),
    StatisticModel.Statistic(index: 0, title: 'Students', count: 35789),
    StatisticModel.Statistic(index: 0, title: 'Students', count: 35789),
  ];

  _Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              _statistics.length,
              (index) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    _Statistic(
                      title: _statistics[index].title,
                      count: _statistics[index].count,
                    ),
                    index != _statistics.length - 1
                        ? Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.10),
                            height: 20,
                            child: VerticalDivider(
                              color: Colors.grey[600],
                            ),
                          )
                        : Container(),
                  ]))),
    );
  }
}

class _Statistic extends StatelessWidget {
  final String title;
  final int count;

  const _Statistic({Key? key, required this.title, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey[600])),
        Text(currencyFormat.format(count), style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
