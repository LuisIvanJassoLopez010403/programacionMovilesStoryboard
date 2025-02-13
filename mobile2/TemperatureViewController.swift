//
//  TemperatureViewController.swift
//  mobile2
//
//  Created by ITIT on 05/02/25.
//

import UIKit

class TemperatureViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgResult: UIImageView!
    @IBOutlet weak var txtCelsius: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        let celsius = Double (txtCelsius.text ?? "0.0") ?? 0.0
        
        lblResult.text = "El resultado es \(converter(celsius: celsius)) grados fahrenheit"
    }
    
    func converter (celsius: Double) -> Double {
        let result = (celsius * 9 / 5) + 32
        
        if (result < 32) {
            imgResult.image = UIImage(named: "snowman")
        } else if (result >= 32 && result < 83) {
            imgResult.image = UIImage(named: "beach")
        } else {
            imgResult.image = UIImage(named: "sun")
        }
        return result
    }

    @IBAction func reset(_ sender: Any) {
        txtCelsius.text = ""
        lblResult.text = ""
        imgResult.image = UIImage(named: "question")
    }
}
