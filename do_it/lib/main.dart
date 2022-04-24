import 'package:do_it/core/app_model.dart';
import 'package:do_it/core/provider/provider_setup.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('firebase error ${snapshot.error}');
          return const FirebaseError();
        }

        // Once complete, show application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyFirebaseApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Loading();
      }
    );
  }
}

class MyFirebaseApp extends StatelessWidget {
  
  const MyFirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        return ChangeNotifierProvider.value(
          value: AppModel(
            firebaseMessaging: Provider.of(context)
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutePaths.authSelectionPage,
            onGenerateRoute: AppRouter.generateRoute,
            builder: (context, child) {
              return child!;
            },
          )
        );
      },
    );
  }
}

class FirebaseError extends StatelessWidget {
  const FirebaseError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('An error occurred initialising Firebase'),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}
