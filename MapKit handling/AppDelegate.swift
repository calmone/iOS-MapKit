//
//  AppDelegate.swift
//  MapKit handling
//
//  Created by Taehyeon Han on 2018. 9. 11..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    
    // Add UIAlertController on UIViewController
    func showAlert(vc: UIViewController, title: String, message: String, actionTitle: String, actionStyle: UIAlertActionStyle) {
        // Create a UIAlertController.
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create an action of OK.
        let action = UIAlertAction(title: actionTitle, style: actionStyle) { action in
            print("Action OK!!")
        }
        
        // Add an Action of OK.
        alert.addAction(action)
        
        // Activate UIAlert.
        vc.present(alert, animated: true, completion: nil)
    }
    
    // Add ActionSheet display with UIAlertController on UIViewController
    func showActionSheetAlert(vc: UIViewController, title: String, message: String, actions: [UIAlertAction]) {
        // Create a UIAlertController.
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // Add action.
        for action in actions {
            alert.addAction(action)
        }
        
        // Activate UIAlert.
        vc.present(alert, animated: true, completion: nil)
    }
    
}

