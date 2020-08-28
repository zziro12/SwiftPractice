//
//  ViewController.swift
//  TargetAction
//
//  Created by Jinho Choi on 2020/08/27.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image : UIImageView!
    
    @IBOutlet weak var textField1 : UITextField!
    @IBOutlet weak var textField2 : UITextField!
    @IBOutlet weak var textField3 : UITextField!
    
    @IBOutlet weak var textView : UITextView!
    
    @IBOutlet weak var button : UIButton!
    
    var setImage : UIImage? = nil
    
    lazy var imagePicker : UIImagePickerController = {
        let picker : UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.button.isEnabled = false
        

        image.isUserInteractionEnabled = true
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchImageView(sender:)))
        image.addGestureRecognizer(imageTapGesture)
        
        let objects = [textField1,textField2,textField3 ]
        objects.forEach{ obj in obj?.addTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
        }

    }
    @objc func touchImageView(sender : UITapGestureRecognizer){
        //check gesture.state
        if(sender.state == .ended ){
            print("touch imageView")
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        setImage = editedImage ?? originalImage
        // editedImage가 nil이면 originalImage를 넣으라는 뜻
        image.contentMode = .scaleAspectFit
        image.image = setImage
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func editingChanged(_ object: Any) {
        if setImage != nil {
            guard
                let top = textField1.text, !top.isEmpty,
                let mid = textField2.text, !mid.isEmpty,
                let but = textField3.text, !but.isEmpty,
                let view = textView.text, !view.isEmpty,
                mid == but
                else {
                    return self.button.isEnabled = false
            }
            return self.button.isEnabled = true
        }
    }
    
}

