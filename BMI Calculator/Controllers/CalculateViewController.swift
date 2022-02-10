//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var valueHeightLb: UILabel!
    @IBOutlet weak var valueWeightLb: UILabel!
    @IBOutlet weak var heightLabel: UISlider!
    @IBOutlet weak var weightLabel: UISlider!
    var calculateBrain = CalculateBrain()
    var bmi:Float?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightValueChanged(_ sender: UISlider) {
        
        let value = String(format: "%.2f", sender.value)
        print(value)
        valueHeightLb.text = "\(value) m"
    }
    @IBAction func weightValueChanged(_ sender: UISlider) {
        let value = String(format: "%.1f", sender.value)

        valueWeightLb.text = "\(value) Kg"
    }
    
    

    @IBAction func caculatePressed(_ sender: UIButton) {
        let height = Float(heightLabel.value)
//        print("height: \(height)")
        let weight = Float(weightLabel.value)
//        print("weight: \(weight)")
        
        bmi = calculateBrain.calculateBMI(height: height, weight: weight)
        
//        bmi = weight/pow(height, 2)
//        print(bmi)
        
        //chuyển sang màn hình RecalculateViewController
        self.performSegue(withIdentifier: "goToResults", sender: self)

    }
    //ghi đè lên để truyền dl sang ResultesController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            //Khai báo biển để ép kiểu
            let destinationVC = segue.destination as! ResultsViewController
            //truy cập thuộc tính cỉa ResultesController
            destinationVC.bmiValue = calculateBrain.getBMI()
            destinationVC.adviceValue = calculateBrain.getAdvice()
            destinationVC.colorValue = calculateBrain.getColor()
            
        }
    }
    
}

