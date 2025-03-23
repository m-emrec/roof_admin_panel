part of "../../main.dart";

/// Core initialization
///
/// This class is responsible for initializing the core functionalities of the app
///
/// This class is called in the main function before the app is run
///
/// This class initializes the following:
/// - WidgetsFlutterBinding
/// - Firebase
/// - Localization
class _CoreInit {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _initFirebaseRemoteConfig();
    await _LocalizationInit().initLocale();
  }
}

Future<void> _initFirebaseRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.ensureInitialized();
  await remoteConfig.fetchAndActivate();
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ),
  );
}
