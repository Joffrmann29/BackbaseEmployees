//
//  AppDelegate.swift
//  BackbaseEmployees
//
//  Created by Joffrey Mann on 2/4/16.
//  Copyright © 2016 Joffrey Mann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        NSShadow *shadow = [[NSShadow alloc] init];
//        shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
//        shadow.shadowOffset = CGSizeMake(0, 1);
//        
//        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//        [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
//        shadow, NSShadowAttributeName,
//        [UIFont fontWithName:@"Arial" size:17.0], NSFontAttributeName, nil]];
//        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//        
//        CGRect navBounds = CGRectMake(0, 0, 320, 64);
//        self.navController.navigationBar.bounds = navBounds;
//        
//        CALayer * bgGradientLayer = [self gradientBGLayerForBounds:navBounds];
//        UIGraphicsBeginImageContext(bgGradientLayer.bounds.size);
//        [bgGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
//        UIImage * bgAsImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
        
        

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

