//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Thông Đoàn on 05/08/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct CalculateBrain {
    
    
    var bmi:BMI?
    mutating func calculateBMI(height: Float, weight: Float) -> Float {
        let bmiValue = weight/pow(height, 2)
        print(bmiValue)
        switch bmiValue {
        case 0..<18.5:
            bmi =  BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.2314149439, green: 0.6787985563, blue: 0.9722380042, alpha: 1))
        case 18.5..<24.9:
            bmi =  BMI(value: bmiValue, advice: "Fit as  a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case 24.9... :
            bmi =  BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        default:
            print(4)
        }
    
        return bmi!.value
    }
    
    func getBMI() -> String {
        return String(format: "%.1f",  bmi?.value as! CVarArg)
    }
    func getAdvice() -> String {
        return bmi!.advice
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
}
