//
//  DisplayViewController.swift
//  assignmentFour
//
//  Created by karma on 2/27/22.
//

import UIKit

class DisplayViewController: UIViewController {

//    @IBOutlet weak var displayTV: UITextView!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var highestLabel: UILabel!
    
    @IBOutlet weak var descDisplayLabel: UILabel!
    
   
    @IBOutlet weak var highestDisplayLabel: UILabel!
    
    var salaries: [Double] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Display salary"
        mapSalaries(sal: salaries)
        print(salaries)

    }
    
    func mapSalaries (sal:[Double]){
        let salary = sal
        let mappedSal = salary.compactMap{nums in return nums}
        
        // make it into set to make it unique
        let uniqSal = Set(mappedSal)
        let uniqSortedSal = Array(uniqSal).sorted(by: >)
//        let stringArray = uniqSortedSal.map { String($0) }
//        let string = stringArray.joined(separator: "-")
//        let stringArray = "\(uniqSortedSal)"
        
        descDisplayLabel.text = "\(Array(mappedSal).sorted(by: >))"
        highestDisplayLabel.text = "The distinct first and second highest are: \(uniqSortedSal[0]) and \(uniqSortedSal[1]) respectively"
//        print(stringArray)
//
//        print("uniq desc \(uniqSortedSal)")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
