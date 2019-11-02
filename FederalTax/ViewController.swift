//
//  ViewController.swift
//  FederalTax
//
//  Created by Hartley, Keira on 2019-11-01.
//  Copyright © 2019 Hartley, Keira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var annualIncome: UITextField!
    @IBOutlet weak var textError: UILabel!
    @IBOutlet weak var taxOwing: UILabel!
    @IBOutlet weak var taxRate: UILabel!
    
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func calculateTax(_ sender: Any) {
        textError.text = ""

        // Guard to make sure the user inputed an income amount
        guard let stringAnnualIncome = (annualIncome.text) else {
            textError.text = ("Please input your income")
            return
        }
        
        // Guard to make sure the user inputed a name
    guard let name = (inputName.text) else {
            textError.text = ("Please input a name")
            return
        }
        
        // Change text string into integer
        guard let doubleAnnualIncome = Double(stringAnnualIncome) else {
            textError.text = ("Please input a whole number")
            return
        }
        
        // Get the proper taxPercent as a decimal
        
        var taxPercent = 0.0
        let taxPercentDecimal = taxPercent / 100
        var taxOwingNumber = 0.0
        
        let firstCaseTotal = 7_144.5
        let secondCaseTotal = 9_763.74
        let thirdCaseTotal = 13_625.82
        let fourthCaseTotal = 18_183.87
        
    
        switch doubleAnnualIncome {
        case 0...47630:
            taxPercent = 15.0
            let firstNumber = doubleAnnualIncome * taxPercentDecimal
            taxOwingNumber = firstNumber
            
        case 47631...95259:
            taxPercent = 20.5
            let secondCase = doubleAnnualIncome - 47630
            let secondNumber = secondCase * taxPercentDecimal
            taxOwingNumber = secondNumber + firstCaseTotal
            
        case 95260...147667:
            taxPercent = 26.0
            let thirdCase = doubleAnnualIncome - 95259
            let thirdNumber = thirdCase * taxPercentDecimal
            taxOwingNumber = thirdNumber + secondCaseTotal + firstCaseTotal
            
        case 147668...210371:
            taxPercent = 29.0
            let fourthCase = doubleAnnualIncome - 147667
            let fourthNumber = fourthCase * taxPercentDecimal
            taxOwingNumber = fourthNumber + thirdCaseTotal + secondCaseTotal + firstCaseTotal
            
        default:
            taxPercent = 33.0
            let fifthCase = doubleAnnualIncome - 210371
            let fifthNumber = fifthCase * taxPercentDecimal
             taxOwingNumber = fifthNumber + fourthCaseTotal + thirdCaseTotal + secondCaseTotal + firstCaseTotal
            
        }
   
    // "number owed divided by total number"
        let taxRateNumber = (taxOwingNumber / doubleAnnualIncome) * 100
        
        taxRate.text = String(format: "Effective tax percent is: %.2f", taxRateNumber)
        taxOwing.text = String(format: "Your federal tax owing is $%.2f", taxOwingNumber)
    }
    
    



}
