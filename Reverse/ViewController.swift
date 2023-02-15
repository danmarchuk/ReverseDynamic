//
//  ViewController.swift
//  Reverse
//
//  Created by Данік on 30/01/2023.
//


import UIKit


class ViewController: UIViewController {
    

    @IBOutlet weak var grayBlueView: UIView!
    
    @IBOutlet weak var defaultReverseLabel: UILabel!
    
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    @IBOutlet weak var customInputTextField: UILabel!
    
    @IBOutlet weak var reversedTextLabel: UILabel!
    
    @IBOutlet weak var userInputTextView: UITextField!
    
    @IBOutlet weak var changeButtonText: UIButton!
    
    let reverseBrain = ReverseBrain()
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            customInputTextField.isHidden = true
            defaultReverseLabel.isHidden = false
        } else if sender.selectedSegmentIndex == 1{
            customInputTextField.isHidden = false
            defaultReverseLabel.isHidden = true
        }
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTextView.delegate = self
        reversedTextLabel.textColor = UIColor.systemBlue
        self.hideKeyboardWhenTappedAround()
        disableButton()
        
        customInputTextField.isHidden = true
        

    }
    
    
    @IBAction func reverseButton(_ sender: UIButton) {
        
        if reversedTextLabel.text?.count == 0 && segmentedControlOutlet.selectedSegmentIndex == 0 {
            if let textToReverse = userInputTextView.text {
                // reverseButton is Clicked
                    let separateWords = reverseBrain.defaultReverseFunction(textToReverse)
                    reversedTextLabel.text = separateWords
                viewBecomesBlue()
                changeButtonText.setTitle("Clear", for: .normal)
                }
        }
        
        else if reversedTextLabel.text?.count == 0 && segmentedControlOutlet.selectedSegmentIndex == 1 && customInputTextField != nil {
            if let textToReverse = userInputTextView.text {
                // reverseButton is Clicked
                if let exception = customInputTextField.text {
                    let separateWords = reverseBrain.customReverseTheWords(textToReverse, exclusion: exception)
                    reversedTextLabel.text = separateWords
                    viewBecomesBlue()
                    changeButtonText.setTitle("Clear", for: .normal)
                }
            }
        }
            // clear button is clicked
         else if reversedTextLabel.text?.count != 0  {
            reversedTextLabel.text = ""
            userInputTextView.text = ""
            changeButtonText.setTitle("Reverse", for: .normal)
            userInputTextView.endEditing(true)
            viewBecomesGray()
            disableButton()

        }
    }
    
    
    
    
    func viewBecomesBlue() {
        grayBlueView.backgroundColor = UIColor.systemBlue
    }
    
    func viewBecomesGray() {
        grayBlueView.backgroundColor = UIColor.systemGray
    }
    
    func disableButton() {
        changeButtonText.isEnabled = false
    }
    func enableButton() {
        changeButtonText.isEnabled = true
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
            viewBecomesBlue()
            textField.becomeFirstResponder()

    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count != 0 {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

// MARK: - dismissKeyboard when tapped around
extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        viewBecomesGray()
    }
}
