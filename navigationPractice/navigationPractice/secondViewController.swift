//
//  secondViewController.swift
//  navigationPractice
//
//  Created by Jinho Choi on 2020/09/14.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBottomBarWhenPushed = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pop(){
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
