//
//  SumViewController.swift
//  mobile2
//
//  Created by ITIT on 11/02/25.
//

import UIKit

class SumViewController: UIViewController {

    @IBOutlet weak var txtNumber1: UITextField!
    @IBOutlet weak var txtNumber2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            txtNumber1.text = ""
            txtNumber2.text = ""
        }
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let number1 = txtNumber1.text, !number1.isEmpty,
           let number2 = txtNumber2.text, !number2.isEmpty {
            let alert = UIAlertController(
                title: "Result",
                message: "The sum is: \(String(describing: sum(number1: number1, number2: number2))) ",
                preferredStyle: UIAlertController.Style.alert
            )
            let action = UIAlertAction(
                title: "Close",
                style: UIAlertAction.Style.default) {_ in
                    alert.dismiss(animated: true, completion: nil)
                }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(
                title: "Result",
                message: "One of the values in the textfield is not a number or is empty",
                preferredStyle: UIAlertController.Style.alert
            )
            let action = UIAlertAction(
                title: "Close",
                style: UIAlertAction.Style.default) {_ in
                    alert.dismiss(animated: true, completion: nil)
                }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func sum(number1: String, number2: String) -> Int {
        let n1 = Int(number1) ?? 0
        let n2 = Int(number2) ?? 0
        let result = n1 + n2
        return result
    }
}
