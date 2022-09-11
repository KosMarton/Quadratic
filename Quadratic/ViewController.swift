//
//  ViewController.swift
//  Quadratic
//
//  Created by Kós Márton on 2022. 09. 05..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    
    @IBOutlet weak var xOneField: UITextField!
    @IBOutlet weak var xTwoField: UITextField!
    
    @IBOutlet weak var warningSign: UIButton!
    
    @IBOutlet weak var discText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningSign.isHidden = true
        xOneField.isUserInteractionEnabled = false
        xTwoField.isUserInteractionEnabled = false
        warningSign.isUserInteractionEnabled = false
        discText.isUserInteractionEnabled = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        warningSign.isHidden = true
        xOneField.text = ""
        xTwoField.text = ""
        
        let aNum: Float? = Float(aTextField.text!)
        let bNum: Float? = Float(bTextField.text!)
        let cNum: Float? = Float(cTextField.text!)
        
        if (aNum == nil || bNum == nil || cNum == nil)
        {
            return
        }
        
        let discriminant: Float? = pow(bNum!, 2) - (4 * aNum! * cNum!)
        discText.text = discriminant?.description
        print(discriminant as Any)
        if (discriminant! < 0.0)
        {
            warningSign.isHidden = false
            return
        }
        let squaredDiscriminant: Float? = sqrt(discriminant!)
        
        let counterPlus: Float? = -bNum! + squaredDiscriminant!
        print(counterPlus as Any)
        let counterMinus: Float? = -bNum! - squaredDiscriminant!
        print(counterMinus as Any)
        
        let denominator: Float? = 2 * aNum!
        print(denominator as Any)
        
        let xOneNum: Float? = counterPlus! / denominator!
        let xTwoNum: Float? = counterMinus! / denominator!
        
        xOneField.text = xOneNum?.description
        xTwoField.text = xTwoNum?.description
    }
    
    @IBAction func aTextFieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}
