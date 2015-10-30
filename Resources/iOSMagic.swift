//
//  iOSMagic.swift
//
//  Created by Rescue Mission Software on 7/9/15.
//
//

// MARK: Import Statment

import UIKit

// MARK: Type Aliases

typealias XViewController = UIViewController

typealias XButton = UIButton

typealias XLabel = UILabel

typealias XView = UIView

typealias XColor = UIColor

typealias XRect = CGRect

typealias XImage = UIImage

typealias XImageView = UIImageView

typealias XApplicationDelegate = UIApplicationDelegate

// MARK: Extensions

extension XButton {
    var backgroundImage: XImage? {
        get {return backgroundImageForState(.Normal)}
        set {
            setBackgroundImage(newValue, forState: .Normal)
        }
    }
    
    var highlightImage: XImage? {
        get {return backgroundImageForState(.Highlighted)}
        set {
            setBackgroundImage(newValue, forState: .Highlighted)
        }
    }
    
    var attributedText: NSAttributedString? {
        get {return attributedTitleForState(.Normal)}
        set {setAttributedTitle(newValue, forState: .Normal)}
    }
    
    func addTarget(target: AnyObject?,
        action: Selector,
        controlEvents: XControlEvents,
        keyPress: String) {
            addTarget(target, action: action, forControlEvents: controlEvents)
            // On iOS, ignore the key events
    }
}

extension XLabel {
    var labelText: String {
        get {if let value = text {return value} else {return ""}}
        set {text = newValue}
    }
}

// MARK: Functions

func frameForSuperview(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, superview: XView) -> XRect
{
    return XRect(x: x, y: y, width: width, height: height)
}

// MARK: ApplicationMain

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

// MARK ControlEvents

typealias XControlEvents = UIControlEvents
