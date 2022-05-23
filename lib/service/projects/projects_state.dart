
import 'package:orbis_task/model/project.dart';

abstract class ProjectsState {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

class InitialProjectsState extends ProjectsState { }

class GetProjectsState extends ProjectsState {
  late List<Project> projects;

  GetProjectsState(this.projects);
}
class ProjectsErrorState extends ProjectsState {
  String error;

  ProjectsErrorState(this.error);
}
class ProjectsLoadingState extends ProjectsState { }