//
//  OSXMagic.swift
//
//  Created by Rescue Mission Software on 7/9/15.
//
//

// MARK: Import Statment

import AppKit

// MARK: Type Aliases

typealias XViewController = NSViewController

typealias XButton = NSButton

typealias XLabel = NSTextField

typealias XView = NSView

typealias XColor = NSColor

typealias XRect = NSRect

typealias XImage = NSImage

typealias XImageView = NSImageView

typealias XApplicationDelegate = NSApplicationDelegate

// MARK: Extensions

extension XButton
{
    var backgroundImage: XImage? {
        get {return self.image}
        set {
            image = newValue
            imagePosition = .ImageOverlaps
            bordered = false
            setButtonType(.MomentaryChangeButton)
            if let buttonCell = cell as? NSButtonCell {
                buttonCell.imageScaling = .ScaleAxesIndependently
            }
        }
    }
    
    var highlightImage: XImage? {
        get {return alternateImage}
        set {
            alternateImage = newValue
        }
    }
    
    var attributedText: NSAttributedString? {
        get {return attributedTitle}
        set {
            if let newTitle = newValue {
                attributedTitle = newTitle
            }
        }
    }
    
    func addTarget(target: AnyObject?,
        action: Selector,
        controlEvents: XControlEvents,
        keyPress: String) {
            self.target = target
            self.action = action
            // On OSX, ignore the control events
            keyEquivalent = keyPress
    }
}

extension XLabel {
    var labelText: String {
        get {return self.stringValue}
        set {self.stringValue = newValue}
    }
}

extension XView {
    var backgroundColor: XColor? {
        get {return nil}
        set {
            wantsLayer = true
            guard let layer = layer else { return }
            layer.backgroundColor = newValue?.CGColor
        }
    }
}

// MARK: Functions

func frameForSuperview(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, superview: XView) -> XRect
{
    let superSize = superview.bounds.size
    let actualY = superSize.height - (y + height)
    
    return XRect(x: x, y: actualY, width: width, height: height)
}

// MARK: ApplicationMain

@NSApplicationMain
class AppDelegate: NSObject {
    
}

// MARK: ControlEvents

enum XControlEvents: Int {
    case TouchUpInside = 64
}
