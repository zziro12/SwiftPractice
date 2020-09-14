//
//  ViewController.swift
//  navigationPractice
//
//  Created by Jinho Choi on 2020/09/14.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func push(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }


}

