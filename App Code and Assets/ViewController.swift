//
//  ViewController.swift
//  IntCalculatorMikeEllard
//
//  Created by Rescue Mission Software on 1/26/15.
//
//

class ViewController: XViewController {
    
    // MARK: Properties
    
    var operation: Operation?
    var storedRegister: Int?

    weak var displayPanel: XLabel!
    
    // MARK: Screen Configuration
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        let mainView: XView = self.view
        
        mainView.backgroundColor =
            XColor(red: 211/255,
                green: 166/255,
                blue: 110/255,
                alpha: 1.0)
        
        let mainViewSize = mainView.bounds.size
        
        let buttonWidth: CGFloat = mainViewSize.width / 4
        let buttonHeight: CGFloat = buttonWidth / 2
        
        let columnSpacer: CGFloat = buttonWidth / 8
        
        let column1: CGFloat = buttonWidth * 3 / 8
        let column2: CGFloat = column1 + buttonWidth + columnSpacer
        let column3: CGFloat = column2 + buttonWidth + columnSpacer
        
        let rowSpacer = columnSpacer
        
        let row0 = rowSpacer * 4
        let row1 = row0 + buttonHeight + (rowSpacer * 2)
        let row2 = row1 + buttonHeight + rowSpacer
        let row3 = row2 + buttonHeight + (rowSpacer * 2)
        let row4 = row3 + buttonHeight + rowSpacer
        let row5 = row4 + buttonHeight + rowSpacer
        let row6 = row5 + buttonHeight + rowSpacer
        
        let displayPanelBackgroundFrame = frameForSuperview(column1,
            y: row0,
            width:(buttonWidth * 3) + (columnSpacer * 2),
            height: buttonHeight, superview: self.view)
        
        let displayPanelBackground = XImageView(frame: displayPanelBackgroundFrame)
        displayPanelBackground.image = XImage(named:"ButtonBack")
        
        #if os(OSX)
            displayPanelBackground.imageScaling = .ScaleAxesIndependently
        #endif
        
        self.view.addSubview(displayPanelBackground)
        
        let displayPanelFrame = frameForSuperview(column1 + 1.5 * columnSpacer, y: rowSpacer * 5, width: (buttonWidth * 3) - columnSpacer, height: rowSpacer * 2, superview: self.view)
        
        let dPanel = XLabel(frame: displayPanelFrame)
        dPanel.labelText = ""
        dPanel.backgroundColor = XColor.clearColor()
        //dPanel.enabled = false
        
        self.view.addSubview(dPanel)
        dPanel.textColor = XColor.whiteColor()
        
        #if os(OSX)
            dPanel.editable = false
            dPanel.selectable = false
            dPanel.bordered = false
            dPanel.drawsBackground = false
        #endif
        
        self.displayPanel = dPanel

        
        addButtonWithTitle("C",
            x:column1 ,
            y:row1,
            width:buttonWidth ,
            height:buttonHeight,
            tag:0,
            action:"clearPressed:")
        
        addButtonWithTitle("+",
            x:column2 ,
            y:row1,
            width:buttonWidth,
            height:buttonHeight,
            tag:Operation.Add.rawValue,
            action:"operationPressed:")
        
        addButtonWithTitle("-",
            x:column3 ,
            y:row1,
            width:buttonWidth ,
            height:buttonHeight,
            tag:Operation.Subtract.rawValue,
            action:"operationPressed:")
        
        addButtonWithTitle("X",
            x:column2 ,
            y:row2,
            width:buttonWidth ,
            height:buttonHeight,
            tag:Operation.Multiply.rawValue,
            action:"operationPressed:")
        
        addButtonWithTitle("/",
            x:column3,
            y:row2,
            width:buttonWidth ,
            height:buttonHeight,
            tag:Operation.Divide.rawValue,
            action:"operationPressed:")
        
        addButtonWithTitle("+/-",
            x:column1,
            y:row2,
            width:buttonWidth,
            height:buttonHeight,
            tag:0,
            action:"changeSign:")
        
        addButtonWithTitle("1",
            x:column1,
            y:row3,
            width:buttonWidth ,
            height:buttonHeight,
            tag:1,
            action:"numberPressed:")
        
        addButtonWithTitle("2",
            x:column2,
            y:row3,
            width:buttonWidth ,
            height:buttonHeight,
            tag:2,
            action:"numberPressed:")
        
        addButtonWithTitle("3",
            x:column3,
            y:row3,
            width:buttonWidth,
            height:buttonHeight,
            tag:3,
            action:"numberPressed:")
        
        addButtonWithTitle("4",
            x:column1,
            y:row4,
            width:buttonWidth,
            height:buttonHeight,
            tag:4,
            action:"numberPressed:")
        
        addButtonWithTitle("5",
            x:column2,
            y:row4,
            width:buttonWidth,
            height:buttonHeight,
            tag:5,
            action:"numberPressed:")
        
        addButtonWithTitle("6",
            x:column3,
            y:row4,
            width:buttonWidth,
            height:buttonHeight,
            tag:6,
            action:"numberPressed:")
        
        addButtonWithTitle("7",
            x:column1,
            y:row5,
            width:buttonWidth,
            height:buttonHeight,
            tag:7,
            action:"numberPressed:")
        
        addButtonWithTitle("8",
            x:column2,
            y:row5,
            width:buttonWidth,
            height:buttonHeight,
            tag:8,
            action:"numberPressed:")
        
        addButtonWithTitle("9",
            x:column3,
            y:row5,
            width:buttonWidth,
            height:buttonHeight,
            tag:9,
            action:"numberPressed:")
        
        addButtonWithTitle("0",
            x:column2,
            y:row6,
            width:buttonWidth,
            height:buttonHeight,
            tag:0,
            action:"numberPressed:")
        
        addButtonWithTitle("%",
            x:column1,
            y:row6,
            width:buttonWidth,
            height:buttonHeight,
            tag:Operation.Remainder.rawValue,
            action:"operationPressed:")
        
        addButtonWithTitle("=",
            x:column3,
            y:row6,
            width:buttonWidth,
            height:buttonHeight,
            tag:0,
            action:"equalsPressed:")
        
    }
    
    func addButtonWithTitle(title: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, tag: Int, action:Selector)
    {
        let buttonFrame = frameForSuperview(x, y: y, width: width, height: height, superview: view)
        
        let button = XButton(frame: buttonFrame)
        
        button.backgroundImage = XImage(named: "ButtonBack")
        button.highlightImage = XImage(named: "ButtonHighlight")
        
        let textColor = XColor.whiteColor()
        
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.Center
        let attrsDictionary = [NSForegroundColorAttributeName : textColor, NSParagraphStyleAttributeName : style]
        let attrString = NSAttributedString(string: title, attributes: attrsDictionary)
        
        button.attributedText = attrString
        
        button.addTarget(self, action:action, controlEvents:.TouchUpInside, keyPress:title)
        
        button.tag = tag
        
        view.addSubview(button)
    }
    
    // MARK: Rotation (iOS only)
    
    #if (os(iOS))
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    #endif

    // MARK: Button Methods
 
    @IBAction func clearPressed(sender: XButton) {
        
        displayPanel.labelText = ""
    }

    @IBAction func changeSign(sender: XButton) {
        
        let possibleInt = Int(displayPanel.labelText)
            
        if let actualInt = possibleInt {
            
            displayPanel.labelText = "\(-1 * actualInt)"
        }
    }
    
    @IBAction func operationPressed (sender: XButton) {
        
        operation = Operation(rawValue: sender.tag)
        
        storedRegister = Int(displayPanel.labelText)
        
        displayPanel.labelText = ""
    }
    
    @IBAction func equalsPressed(sender: XButton) {
        
        let displayRegister: Int? = Int(displayPanel.labelText)
        
        if (storedRegister != nil && displayRegister != nil) {
            
            var result: String
            
            if let op = operation {
            
                switch op {
                    
                    case .Add:
                        result = add(storedRegister!, addend: displayRegister!)
                    case .Subtract:
                        result = subtract(storedRegister!, subtrahend: displayRegister!)
                    case .Multiply:
                        result = multiply(storedRegister!, multiplier: displayRegister!)
                    case .Divide:
                        result = divide(storedRegister!, divisor: displayRegister!)
                    case .Remainder:
                        result = remainder(storedRegister!, divisor: displayRegister!)
                }
            }
            else
            {
                result = "No operation"
            }
            
            displayPanel.labelText = result
        }
    }
    
    @IBAction func numberPressed(sender: XButton) {
        
        displayPanel.labelText = displayPanel.labelText + String(sender.tag)
    }
}

// The following brings along all of Foundation and UIKit for the ride.

#if os(iOS)
    import UIKit.NSAttributedString
#elseif os(OSX)
    import AppKit.NSAttributedString
#endif
