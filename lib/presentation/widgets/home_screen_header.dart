import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:orbis_task/model/user.dart';
import 'package:orbis_task/presentation/widgets/loading.dart';
import 'package:orbis_task/service/users/users_provider.dart';
import 'package:orbis_task/service/users/users_state.dart';

import 'home_page_profile_card.dart';

class HomeScreenHeader extends ConsumerWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(usersNotifierProvider.notifier).getUsers();
    });
    final double userProfileCardHeight = MediaQuery.of(context).size.height * 0.30;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text('Classes', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text('Logo'),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text('Mentors', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('View all', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10.0),
        HookConsumer(
          builder: (_, WidgetRef ref, child) {
            final state = ref.watch<UsersState>(usersNotifierProvider);

            if (state is GetUsersState) {
              List<User> users = state.users;
              return SizedBox(
                height: userProfileCardHeight,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return HomePageProfileCard(user: users[index]);
                    }),
              );
            }
            if (state is UsersLoadingState) {
              return const Loading(alignment: Alignment.center);
            }
            if (state is InitialUsersState) {
              return const Loading(alignment: Alignment.center);
            }
            return Container();
          },
        )
      ],
    );
  }
}
