//
//  AppDelegate.m
//  FriendDemo
//
//  Created by 李雪阳 on 2020/3/23.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "AppDelegate.h"
#import "FriendViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor=[UIColor whiteColor];
    UINavigationController *root = [[UINavigationController alloc] initWithRootViewController:[FriendViewController new]];
    self.window.rootViewController=root;
    
    
    
    return YES;
}





@end
