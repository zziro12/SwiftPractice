//
//  ViewController.swift
//  stackViewPractice
//
//  Created by Jinho Choi on 2020/09/10.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumberButtons: [CircleButton]!
    @IBOutlet weak var phoneCallButton: CircleButton!
    
    var phoneNumberString = ""{
        didSet{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for buttonItem in phoneNumberButtons {
            buttonItem.addTarget(self, action: #selector(onNumberButtonClicked(sender:)), for: .touchUpInside)
        }
        phoneCallButton.addTarget(self, action: #selector(onPhoneCallbuttonClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc fileprivate func onNumberButtonClicked(sender: UIButton){
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    
    @objc fileprivate func onPhoneCallbuttonClicked(_ sender: UIButton){
        phoneNumberString.removeAll()
    }

}

