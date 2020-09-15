//
//  secondViewController.swift
//  SimpleTable
//
//  Created by Jinho Choi on 2020/09/14.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
        self.textLabel.text = textToSet
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
