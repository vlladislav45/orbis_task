import 'package:flutter/material.dart';
import 'package:orbis_task/model/view/specification.dart';

class ProfileSpecifications extends StatefulWidget {
  const ProfileSpecifications({Key? key}) : super(key: key);

  @override
  State<ProfileSpecifications> createState() => _ProfileSpecificationsState();
}

class _ProfileSpecificationsState extends State<ProfileSpecifications> {
  final List<Specification> _specifications = [
    Specification(
      index: 0,
      title: 'Courses',
    ),
    Specification(
      index: 1,
      title: 'Source files',
    ),
    Specification(
      index: 2,
      title: 'Discussion',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_specifications.length, (index) => SpecificationNavTitle(title: _specifications[index].title)),
            ),
          ),
          SpecificationCard(),
        ],
      ),
    );
  }
}

class SpecificationNavTitle extends StatelessWidget {
  final String title;

  const SpecificationNavTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.25,
        color: Colors.white,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class SpecificationCard extends StatelessWidget {
  const SpecificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Become a UX Designer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  Text('Learn the skills & get the Job',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      )),
                ],
              ),
              Container(
                child: Icon(Icons.heart_broken, size: 20),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
              alignment: Alignment.centerLeft,
              child: Text('/ / / / /', style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w600))),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('4.85',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      )),
                  Container(
                    child: Icon(Icons.star_sharp, size: 14),
                  ),
                  Text('ratings',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
              Text('48h',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
