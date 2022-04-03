import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/screens/register/register.dart';

import 'package:liberty_app/presentation/screens/login/login.dart';
import 'package:liberty_app/presentation/screens/onboard/onboard.dart';
import 'package:liberty_app/presentation/screens/project/project.dart';
import 'package:liberty_app/presentation/screens/task/task.dart';
import 'package:liberty_app/app/app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })
      : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) =>
            AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: AppRoutes.onGenerateAppViewPages,
      ),
    );
  }
}
