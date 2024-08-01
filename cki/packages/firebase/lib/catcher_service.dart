part of firebase;

class CatcherService {
  CatcherService({required this.child, this.function});
  final Widget child;
  final Function? function;

  CatcherOptions debugOptions = CatcherOptions(
    SilentReportMode(),
    [
      ConsoleHandler(enableStackTrace: false, enableDeviceParameters: false),
    ],
    screenshotsPath: "assets/screenshots/",
   
  );
  CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [

  ]);
  Future<void> catcher() async {
    Catcher(
        rootWidget: child,
        debugConfig: debugOptions,
        runAppFunction: () async {
          if (function != null) {
            function!();
          }
        },
        releaseConfig: releaseOptions,
        ensureInitialized: true);
  }
}
