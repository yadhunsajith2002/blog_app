part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppuserLoggedIn extends AppUserState {
  final User user;

  AppuserLoggedIn(this.user);
}
