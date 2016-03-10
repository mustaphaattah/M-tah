//
//  ViewController.swift
//  Assignment2
//
//  Created by TheMainMan on 2016-02-26.
//  Copyright © 2016 TheMainMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var decimalButton: UIButton!
    @IBOutlet var ternaryButton: UIButton!
    @IBOutlet var octalButton: UIButton!
    @IBOutlet var userText: UITextField!
    
    
    
    @IBAction func decimalSelected(sender: AnyObject) {
        //button color
        selectButton(decimalButton)
        
        var userInput = parseString(userText.text!)
        //converts to decimal
        if userInput[0] == "nil"{
            errorMessage()
        }else{
            userText.backgroundColor = UIColor.whiteColor()
            let decimalNum = toDecimal(userInput[0], numValue: Int(userInput[1])!)
            userText.text = "d:" + "\(decimalNum)"
        }
    }

    @IBAction func ternarySelected(sender: AnyObject) {
        //button colors
        selectButton(ternaryButton)
        
        var userInput = parseString(userText.text!)
        if userInput[0] == "nil"{
            errorMessage()
        }else{
            //convert to decimal
            let decimalNum = toDecimal(userInput[0], numValue: Int(userInput[1])!)
            //convert to ternary
            let ternaryNum = toTernary(decimalNum)
            userText.text = "t:" + ternaryNum
        }
    }
    
    @IBAction func octalButton(sender: AnyObject) {
        //button colors
        selectButton(octalButton)
        
        var userInput = parseString(userText.text!)
        if userInput[0] == "nil"{
            errorMessage()
        }else{
            //convert to decimal
            let decimalNum = toDecimal(userInput[0], numValue: Int(userInput[1])!)
            //convert to octal
            let octalNum = toOctal(decimalNum)
            userText.text = "o:" + octalNum
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func that converts ternary and octal to decimal
    func toDecimal (type: String, var numValue: Int)->Int{
        if type == "d" {
            userText.backgroundColor = UIColor.whiteColor()
            return numValue
        }
        else if type == "t"{
            //convert from ternary to decimal
            userText.backgroundColor = UIColor.whiteColor()
            var decimal = 0, i = 0
            while numValue != 0 {
                let mod = numValue % 10
                numValue /= 10
                decimal += mod * Int(pow(3, Double(i++)))
            }
            return decimal
        }
        else if type == "o"{
            // convert from octal to decimal
            userText.backgroundColor = UIColor.whiteColor()
            var decimal = 0, i = 0
            while numValue != 0 {
                let mod = numValue % 10
                numValue /= 10
                decimal += mod * Int(pow(8, Double(i++)))
            }
            return decimal
        }
        else{
            //error message
            errorMessage()
            return -1
        }
    }
    
    // func that converts decimal to ternary
    func toTernary(var aDecimal: Int)->String{
        var ternary: String = ""
        while aDecimal != 0 {
            ternary = "\(aDecimal % 3)" + ternary
            aDecimal /= 3
        }
        return ternary
    }
    
    //func that converts decimal to octal
    func toOctal(var aDecimal: Int)->String{
        var octal: String = ""
        while aDecimal != 0 {
            octal = "\(aDecimal % 8)" + octal
            aDecimal /= 8
        }
        return octal
    }
    
    //splits string into two at the ":" first part specifies the base
    //and second part is the number
    func parseString (text: String)->[String]{
        if text.containsString(":") {
            let inputs = text.componentsSeparatedByString(":")
            return inputs
        }
        else{
            return ["nil"]
        }
    }
    
    //handles error output
    func errorMessage(){
        userText.backgroundColor = UIColor.redColor()
        userText.text = "ERROR"
    }

    //handles button colors
    func selectButton(button: UIButton) {
        //deselect all
        decimalButton.backgroundColor = UIColor.redColor()
        ternaryButton.backgroundColor = UIColor.redColor()
        octalButton.backgroundColor = UIColor.redColor()
        
        //select button
        button.backgroundColor = UIColor.greenColor()
    }
    
}

