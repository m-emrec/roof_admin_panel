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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.backgroundColor[50],
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    await Firebase.initializeApp();
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.ensureInitialized();
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );
    await _LocalizationInit().initLocale();
  }
}
