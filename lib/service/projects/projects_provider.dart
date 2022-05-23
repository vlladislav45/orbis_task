

import 'package:get_it/get_it.dart';
import 'package:orbis_task/api/project_api.dart';
import 'package:orbis_task/model/project.dart';
import 'package:riverpod/riverpod.dart';

import 'projects_state.dart';

final projectsNotifierProvider = StateNotifierProvider.autoDispose<ProjectsNotifier, ProjectsState>(
      (ref) => ProjectsNotifier(
    GetIt.I.get<ProjectAPI>(),
  ),
);

class ProjectsNotifier extends StateNotifier<ProjectsState> {
  final ProjectAPI _projectAPI;

  ProjectsNotifier(this._projectAPI) : super(InitialProjectsState());

  void getProjects(String username) async {
    state = ProjectsLoadingState();

    try {
      final List<Project>? projects = await _projectAPI.getProjectsByUsername(username);
      if(projects != null && projects.isNotEmpty) {
        state = GetProjectsState(projects);
      }
    } catch (e) {
      state = ProjectsErrorState('Error while fetching user projects, ${e.toString()}');
    }
  }
}