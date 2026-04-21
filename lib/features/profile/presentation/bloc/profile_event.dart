abstract class ProfileEvent {}

class UpdateUsernameEvent extends ProfileEvent {
  final String userId;
  final String newUserName;

  UpdateUsernameEvent({required this.userId, required this.newUserName});
}
