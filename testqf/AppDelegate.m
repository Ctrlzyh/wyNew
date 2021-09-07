//
//  AppDelegate.m
//  testqf
//
//  Created by qiaofang on 2021/9/1.
//

#import "AppDelegate.h"
#import "FunctionViewController.h"
#import "HomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    ViewController *controller = [[ViewController alloc] init];
//    [controller.view setBackgroundColor:[UIColor whiteColor]];
//    UINavigationController *Nav = [[UINavigationController alloc] initWithRootViewController:controller];
//
//    [self.window setRootViewController:Nav];
//    ViewController *controller = [[ViewController alloc] init];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [homeVC.view setBackgroundColor:[UIColor whiteColor]];
//    [homeVC setTitle:@"我的"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.navigationBar.translucent = YES;
    
    FunctionViewController *funcVC = [[FunctionViewController alloc] init];
    [funcVC.view setBackgroundColor:[UIColor grayColor]];
    [funcVC setTitle:@"功能"];
    UINavigationController *funcNav = [[UINavigationController alloc] initWithRootViewController:funcVC];
    funcNav.navigationBar.translucent = NO;
    
    NSArray *vcArray = [NSArray arrayWithObjects:homeNav,funcNav,nil];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = vcArray;
    self.window.rootViewController = tabBarVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
