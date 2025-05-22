abstract class JobRoleState {}

class JobRoleInitialState extends JobRoleState{}

class JobRoleLoadingState extends JobRoleState{}

class JobRoleLoadedState extends JobRoleState{
  final List<String> JobRoles;

  JobRoleLoadedState( this.JobRoles);
}

class JobRoleErrorState extends JobRoleState{
  final String message;

  JobRoleErrorState( this.message);
}