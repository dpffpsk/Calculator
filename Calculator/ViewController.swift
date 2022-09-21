//
//  ViewController.swift
//  Calculator
//
//  Created by won on 2022/08/30.
//

import UIKit

enum Operation {
    case divid
    case multiply
    case subtract
    case add
    case unknown
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var resultLabel: UILabel!

    var displayNumber = ""
    var firstValue = ""
    var secondValue = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    // 숫자 버튼
    @IBAction func tapNumberButton(_ sender: UIButton) {
//        guard let numberValue = sender.titleLabel?.text { return }
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            if !displayNumber.isEmpty || Int(numberValue) != 0 {
                self.displayNumber += numberValue
                self.resultLabel.text = self.displayNumber
            }
            
            if displayNumber.isEmpty && self.currentOperation != .unknown {
                self.displayNumber += numberValue
                self.resultLabel.text = self.displayNumber
            }
        }
    }
    
    // AC 버튼
    @IBAction func tapClearButton(_ sender: Any) {
        self.displayNumber = ""
        self.resultLabel.text = "0"
        self.firstValue = ""
        self.secondValue = ""
        self.result = ""
        self.currentOperation = .unknown
    }
    
    // . 버튼
    @IBAction func tapDotButton(_ sender: Any) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.resultLabel.text = self.displayNumber
        }
    }
    
    // 나누기 버튼
    @IBAction func tapDividButton(_ sender: Any) {
        self.operation(.divid)
    }
    
    // 곱하기 버튼
    @IBAction func tapMutiplyButton(_ sender: Any) {
        self.operation(.multiply)
    }
    
    // 빼기 버튼
    @IBAction func tapSubtractButton(_ sender: Any) {
        self.operation(.subtract)
    }
    
    // 더하기 버튼
    @IBAction func tapAddButton(_ sender: Any) {
        self.operation(.add)
    }
    
    // 결과 버튼
    @IBAction func tapEqualButton(_ sender: Any) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {

                self.secondValue = self.displayNumber
                self.displayNumber = ""
                
                guard let temp1 = Double(self.firstValue) else { return }
                guard let temp2 = Double(self.secondValue) else { return }
                
                switch self.currentOperation {
                case .divid:
                    self.result = "\(temp1/temp2)"
                case .multiply:
                    self.result = "\(temp1*temp2)"
                case .subtract:
                    self.result = "\(temp1-temp2)"
                case .add:
                    self.result = "\(temp1+temp2)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                  self.result = "\(Int(result))"
                }
                
                self.resultLabel.text = self.result
                self.firstValue = self.result
            }
            
            self.currentOperation = operation
            
        } else {
            self.firstValue = self.displayNumber
            self.displayNumber = ""
            self.currentOperation = operation
        }
    }
}

