//
//  ViewController.swift
//  TargetAction
//
//  Created by Jinho Choi on 2020/08/27.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image : UIImageView!
    
    @IBOutlet weak var textField1 : UITextField!
    @IBOutlet weak var textField2 : UITextField!
    @IBOutlet weak var textField3 : UITextField!
    
    @IBOutlet weak var textView : UITextView!
    
    @IBOutlet weak var button : UIButton!
    //        let objects = [image, textField1,textField2,textField3 ,textView]
    //        let objects = [textField1,textField2,textField3 ]
            
    //        [idTextField, pwdTextField, pwdCheckTextField].forEach { (field) in
    //                field?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    //        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.button.isEnabled = false
        
//        let objects = [textField1,textField2,textField3 ]
//        objects.forEach{ obj in obj?.addTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
//        }
        
        
        

    }
    
    @objc private func Changed(_ image : UIImageView) {
        guard let check = image.image, check.isProxy()  else {
            return self.button.isEnabled = false
        }
        return self.button.isEnabled = true
    }
    
    @objc private func editingChanged(_ textField : UITextField) {
        guard let top = textField1.text, !top.isEmpty,
        let middle = textField2.text, !middle.isEmpty,
        let bottom = textField3.text, !bottom.isEmpty else {
            return self.button.isEnabled = false
        }
        return self.button.isEnabled = true
    }
    
//    @objc private func editingChanged(_ textField: UITextField) {
//        guard
//            let id = idTextField.text, !id.isEmpty,
//            let pwd = pwdTextField.text, !pwd.isEmpty,
//            let pwdCheck = pwdCheckTextField.text, !pwdCheck.isEmpty
//            else {
//                self.nextButtonState(false)
//                return
//        }
//        self.nextButtonState(true)
//    }
}

