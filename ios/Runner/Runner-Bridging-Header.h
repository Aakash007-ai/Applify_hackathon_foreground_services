#import "GeneratedPluginRegistrant.h"
#import <flutter_foreground_task/FlutterForegroundTaskPlugin.h>
#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
//
#import <flutter_foreground_task/FlutterForegroundTaskPlugin.h>
// here
#import <flutter_foreground_task/FlutterForegroundTaskPlugin.h>

// here
void registerPlugins(NSObject<FlutterPluginRegistry>* registry) {
  [GeneratedPluginRegistrant registerWithRegistry:registry];
}

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];

  // here, Without this code the task will not work.
  [FlutterForegroundTaskPlugin setPluginRegistrantCallback:registerPlugins];
  if (@available(iOS 10.0, *)) {
    [UNUserNotificationCenter currentNotificationCenter].delegate = (id<UNUserNotificationCenterDelegate>) self;
  }

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end