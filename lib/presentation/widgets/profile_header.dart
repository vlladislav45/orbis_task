import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:orbis_task/model/user.dart';
import 'package:orbis_task/model/view/statistic.dart' as StatisticModel;
import 'package:intl/intl.dart';
import 'package:orbis_task/presentation/widgets/loading.dart';
import 'package:orbis_task/service/projects/projects_provider.dart';
import 'package:orbis_task/service/projects/projects_state.dart';
import 'package:orbis_task/utils/star_clipper.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

class ProfileHeader extends ConsumerWidget {
  final User user;

  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(projectsNotifierProvider.notifier).getProjects(user.login);
    });
    return HookConsumer(
      builder: (_, ref, child) {
        final state = ref.watch(projectsNotifierProvider);

        if (state is GetProjectsState) {
          return Container(
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: Container(
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
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: ClipPath(
                            clipper: StarClipper(14),
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
                        ),
                      ],
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
                        user.login,
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
                _Statistics(),
              ],
            ),
          );
        } else if (state is ProjectsLoadingState) {
          return const Loading(alignment: Alignment.center);
        } else if (state is ProjectsErrorState) {
          return const Text('Error');
        }
        return Container();
      },
    );
  }
}

class _Statistics extends StatelessWidget {
  // TODO: Add real statistics data in that case of GitHub OpenAPI
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
