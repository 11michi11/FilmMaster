import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication.dart';
import 'authentication/authentication_state.dart';
import 'common/common.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'splash/splash.dart';

void main() {
  final userRepository = UserRepository();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AuthenticationStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmMaster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashPage();
          } else if (state is AuthenticationSuccess) {
            return HomePage();
          } else if (state is AuthenticationFailure) {
            return LoginPage(userRepository: userRepository);
          } else {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}
