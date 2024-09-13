import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_profile/shared/router.dart';
import 'application/profile/profile_bloc.dart';
import 'injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProfileBloc>()..add(const ProfileEvent.started()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Тест',
        routerConfig: router,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
