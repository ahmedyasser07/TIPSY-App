//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip: Float=0.0
    var split=2
    var bill: Float=0.0
    var total: Float=0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
        sender.isSelected=true
        billTextField.endEditing(true)
        bill=Float(billTextField.text!) ?? 0.0
        if zeroPctButton==sender{
            tip=0.0
        }else if tenPctButton==sender{
            tip=0.1
        }else{
            tip=0.2
        }
       
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        split=Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billTextField.text ?? "0.0")
        print(calculateBill(bill: bill, tip: tip, split: split))
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    func calculateBill(bill: Float, tip: Float, split: Int) -> Float{
        let v=1+tip
        total=(bill*v)/Float(split)
        return total
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="goToResults"{
            let dVC=segue.destination as! ResultsViewController
            dVC.split=split
            dVC.result="\(total)"
            dVC.tip=Int(tip*100)
        }
    }
        
}
