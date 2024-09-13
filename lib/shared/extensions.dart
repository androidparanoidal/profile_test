import 'package:flutter_bloc/flutter_bloc.dart';
import '../application/profile/profile_bloc.dart';
import '../domain/user/user.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  Future<T?> navigatorPush<T>(Widget child, {bool rootNavigator = false, bool fullscreenDialog = false}) {
    final route = MaterialPageRoute<T>(builder: (context) => child, fullscreenDialog: fullscreenDialog);
    return Navigator.of(this, rootNavigator: rootNavigator).push(route);
  }

  User get currentUser => watch<ProfileBloc>().state.user;
}
