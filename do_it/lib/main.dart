import 'package:dio/dio.dart';
import 'package:do_it/core/app_model.dart';
import 'package:do_it/core/provider/provider_setup.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/router/router.dart';
import 'package:do_it/core/util/dio_interceptors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("project");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await dotenv.load();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
        final httpClient = Provider.of<Dio>(context);
        httpClient.interceptors.clear();

        final apiKey = dotenv.env['WHISPER_SMS_API_TOKEN'];
        DioInterceptor interceptor = DioInterceptor(apiKey: apiKey!);
        httpClient.interceptors.add(interceptor);
        
        return ChangeNotifierProvider.value(
          value: AppModel(
            firebaseMessaging: Provider.of(context),
            firebaseAuth: Provider.of(context),
            context: context
          ),
          child: MaterialApp(
            navigatorKey: navigatorKey,
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
    return MaterialApp(
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
