//
//  FirstPartialViewController.swift
//  mobile2
//
//  Created by ITIT on 25/02/25.
//

import UIKit

class FirstPartialViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "First Partial View"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            txtWeight.text = ""
            txtHeight.text = ""
        }
    }
    
    @IBAction func calculate(_ sender: Any) {
        let weightInKg = Double (txtWeight.text ?? "0.0") ?? 0.0
        let heightInMeters = Double (txtHeight.text ?? "0.0") ?? 0.0
        
        if let weightInKg = txtWeight.text, !weightInKg.isEmpty,
           let heightInMeters = txtHeight.text, !heightInMeters.isEmpty {
            let alert = UIAlertController(
                title: "Result",
                message: "\(bmi(weight: weightInKg, height: heightInMeters))",
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
    
    func bmi(weight: String, height: String) -> String {
        let w = Double (txtWeight.text ?? "0.0") ?? 0.0
        let h = Double (txtHeight.text ?? "0.0") ?? 0.0
        let result = w / (h * h)
        var patientStatus = ""
        if (result >= 19 && result <= 24.9) {
            patientStatus = "The patient is at a healthy weight"
            return patientStatus
        } else {
            patientStatus = "The patient is NOT at a healthy weight"
            return patientStatus
        }
    }
}
