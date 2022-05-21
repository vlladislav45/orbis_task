import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:orbis_task/presentation/widgets/loading.dart';
import 'package:orbis_task/presentation/widgets/profile_header.dart';
import 'package:orbis_task/presentation/widgets/profile_specifications.dart';
import 'package:orbis_task/service/user/user_provider.dart';
import 'package:orbis_task/service/user/user_state.dart';

class ProfilePage extends ConsumerWidget {
  final String username;

  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(userNotifierProvider.notifier).getUser(username);
    });
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8.0, 30, 8.0, 0),
          child: HookConsumer(
            builder: (_, ref, child) {
              final state = ref.watch(userNotifierProvider);

              if (state is SingleUser) {
                return Column(
                  children: <Widget>[
                    ProfileHeader(user: state.user),

                    const SizedBox(height: 20),

                    ProfileSpecifications(),
                  ],
                );
              } else if (state is SingleUserLoadingState) {
                return const Loading(alignment: Alignment.center);
              } else {
                return const Text('Error');
              }
            },
          ),
        ),
      ),
    );
  }
}
