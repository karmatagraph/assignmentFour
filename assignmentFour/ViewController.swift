//
//  ViewController.swift
//  assignmentFour
//
//  Created by karma on 2/27/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var enterSalLabel: UILabel!
    @IBOutlet weak var salTextfield: UITextField!
    @IBOutlet weak var salaryError: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    // store the salaries in an array
    var salary: [Double] = []
    var personCount = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        
    }
    
    func resetForm(){
        
        personLabel.text = "Person:\(personCount)"
        salTextfield.text = ""
        salaryError.isHidden = false
        salaryError.text = "required"
        
        // if 10th person has entered their salary
        if personCount == 11{
            personLabel.isHidden = true
            enterSalLabel.isHidden = true
            salTextfield.isHidden = true
            salaryError.isHidden = true
            nextBtn.setTitle("Done", for: .normal)
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        // btn clicked
        
        let salaryText = salTextfield.text!
        let set = CharacterSet(charactersIn: salaryText)
        
        // check for empty field
        if !salaryText.isEmpty{
            
            // check for number only input
            if !CharacterSet.decimalDigits.isSuperset(of: set) {
                salaryError.text = "Please enter a valid salary"
            }else{
                var sal = ""
                if salTextfield.text != "" {
                    sal = salTextfield.text!
                }
                
                let doubleSal = Double(sal)
                salary.append(doubleSal!)
                print(salary)
                personCount+=1
                resetForm()
            }
        }else{
            salaryError.text = "please enter a valid salary"
        }
    }
}

