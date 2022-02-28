//
//  InputViewController.swift
//  assignmentFour
//
//  Created by karma on 2/27/22.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var enterSalLabel: UILabel!
    @IBOutlet weak var salTextfield: UITextField!
    @IBOutlet weak var salaryError: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    // store the salaries in an array
    var salary: [Double] = []
    var personCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Input Salary"
        resetForm()
        doneBtn.isHidden = true
        
        // Do any additional setup after loading the view.
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
    @IBAction func doneBtnClicked(_ sender: UIButton) {
        
    }
    func resetForm(){
        
        personLabel.text = "Person:\(personCount)"
        salTextfield.text = ""
        salaryError.isHidden = false
        salaryError.text = "Required salary"
        
        
        // if 10th person has entered their salary
        if personCount == 11{
            personLabel.isHidden = true
            enterSalLabel.isHidden = true
            salTextfield.isHidden = true
            salaryError.isHidden = true
            
//            nextBtn.setTitle("Done", for: .normal)
            nextBtn.isHidden = true
            doneBtn.isHidden = false
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DisplayViewController
        destVC.salaries = salary
    }
}
    
        
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


