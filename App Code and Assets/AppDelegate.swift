//
//  AppDelegate.swift
//  IntCalculatorMikeEllard
//
//  Created by Rescue Mission Software on 1/26/15.
//
//

extension AppDelegate: XApplicationDelegate {

    //  It's easy to have a shared app delegate for this app, since there are no required methods and this AppDelegate doesn't actually do anything.
    
    //  There are a lot of commonalities between the UIApplicationDelegate and NSApplicationDelegate protocols, and a lot of differences as well.
    
    //  Where methods have the exact same name between the two protocols, iOS and OSX could share AppDelegate code.
    
    //  Where iOS and OSX have different AppDelegate methods, it is possible to have them in the same file, since iOS won't call the OSX methods and OSX won't call the iOS methods.  If you choose this approach, you should label clearly which methods will be called by which platforms so that your code is clear.
    
    //  In the end, what you need to do with your App Delegate will indicate whether or not it makes sense to have shared code / a common AppDelegate file.  For this particular do-nothing AppDelegate, there's no reason to have different delegates for the different platforms.
}

